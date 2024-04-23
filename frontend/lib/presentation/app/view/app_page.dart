import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:frontend/data/api/user_api.dart';
import 'package:frontend/l10n/l10n.dart';
import 'package:frontend/presentation/absences/view/absences_page.dart';
import 'package:frontend/presentation/app/cubit/app_cubit.dart';
import 'package:frontend/presentation/app/cubit/app_state.dart';

class AppPage extends StatelessWidget {
  const AppPage({super.key});

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
      home: Scaffold(
        body: BlocProvider(
          create: (_) => AppCubit(UserApi(Dio())),
          child: const _AppView(),
        ),
      ),
    );
  }
}

class _AppView extends StatefulWidget {
  const _AppView();

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
    return BlocBuilder<AppCubit, AppState>(
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
    );
  }
}
