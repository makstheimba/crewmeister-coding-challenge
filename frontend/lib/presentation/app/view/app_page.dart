import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:frontend/data/api/user_api.dart';
import 'package:frontend/l10n/l10n.dart';
import 'package:frontend/presentation/absences/view/absences_page.dart';
import 'package:frontend/presentation/app/cubit/app_cubit.dart';
import 'package:frontend/presentation/app/cubit/app_state.dart';

class AppPage extends StatefulWidget {
  const AppPage({super.key});

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  Locale _locale = const Locale('en');

  void setLocale(Locale locale) {
    setState(() => _locale = locale);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        useMaterial3: true,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: _locale,
      home: BlocProvider(
        create: (_) => AppCubit(UserApi(Dio())),
        child: _AppView(locale: _locale),
      ),
    );
  }
}

class _AppView extends StatefulWidget {
  const _AppView({required this.locale});
  final Locale locale;

  @override
  State<_AppView> createState() => __AppViewState();
}

class __AppViewState extends State<_AppView> {
  @override
  void initState() {
    context.read<AppCubit>().initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(context.l10n.appTitle),
        leadingWidth: 100,
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: ['en', 'de']
              .map(
                (lang) => IconButton(
                  icon: Text(
                    lang,
                    style: TextStyle(
                      fontWeight: widget.locale == Locale(lang) ? FontWeight.bold : FontWeight.normal,
                      color: widget.locale == Locale(lang) ? Colors.black : Colors.grey,
                    ),
                  ),
                  onPressed: () => context.findAncestorStateOfType<_AppPageState>()?.setLocale(Locale(lang)),
                ),
              )
              .toList(),
        ),
      ),
      body: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) => state.when(
          initial: Container.new,
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (users) => AbsencesPage(users: users),
          error: (_) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(context.l10n.appInitializationError),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => context.read<AppCubit>().initialize(),
                  child: Text(context.l10n.appInitializationRetry),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
