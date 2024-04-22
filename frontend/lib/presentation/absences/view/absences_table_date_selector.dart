import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/presentation/absences/cubit/absences_cubit.dart';
import 'package:frontend/presentation/absences/cubit/absences_state.dart';
import 'package:intl/intl.dart';

class AbsencesTableDateSelector extends StatelessWidget {
  const AbsencesTableDateSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        final cubit = context.read<AbsencesCubit>();
        final picked = await showDatePicker(
          context: context,
          initialDate: cubit.state.filterDate ?? DateTime(2021),
          firstDate: DateTime(2021),
          lastDate: DateTime(2022),
        );
        if (picked != null && picked != cubit.state.filterDate) {
          await cubit.loadAbsences(date: picked, type: cubit.state.filterType);
        }
      },
      child: BlocBuilder<AbsencesCubit, AbsencesState>(
        builder: (context, state) {
          return Text(
            state.filterDate != null ? DateFormat('yyyy-MM-dd').format(state.filterDate!) : 'Select date',
          );
        },
      ),
    );
  }
}
