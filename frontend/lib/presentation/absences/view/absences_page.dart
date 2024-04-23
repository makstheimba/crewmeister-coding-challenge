import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/data/api/absences_api.dart';
import 'package:frontend/domain/models/user.dart';
import 'package:frontend/presentation/absences/cubit/absences_cubit.dart';
import 'package:frontend/presentation/absences/cubit/absences_state.dart';
import 'package:frontend/presentation/absences/view/absences_table.dart';

class AbsencesPage extends StatelessWidget {
  const AbsencesPage({required this.users, super.key});
  final HashMap<int, UserModel> users;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => AbsencesCubit(AbsencesApi(Dio())), child: _AbsencesView(users: users));
  }
}

class _AbsencesView extends StatefulWidget {
  const _AbsencesView({required this.users});
  final HashMap<int, UserModel> users;

  @override
  State<_AbsencesView> createState() => __AbsencesViewState();
}

class __AbsencesViewState extends State<_AbsencesView> {
  @override
  void initState() {
    context.read<AbsencesCubit>().loadAbsences();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AbsencesCubit, AbsencesState>(
      listener: (context, state) {
        if (state.errorMessage != null) {
          ScaffoldMessenger.of(context)
            ..clearSnackBars()
            ..showSnackBar(
              const SnackBar(
                content: Text('Something went wrong when trying to load absences. Please, try again later.'),
              ),
            );
        }
      },
      builder: (context, state) {
        return AbsencesTable(users: widget.users);
      },
    );
  }
}
