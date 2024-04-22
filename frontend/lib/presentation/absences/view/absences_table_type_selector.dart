import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/domain/models/absences.dart';
import 'package:frontend/presentation/absences/cubit/absences_cubit.dart';
import 'package:frontend/presentation/absences/cubit/absences_state.dart';

class AbsencesTableTypeSelector extends StatelessWidget {
  const AbsencesTableTypeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AbsencesCubit, AbsencesState>(
      builder: (context, state) {
        return DropdownButton<AbsenceType>(
          hint: const Text('Select Absence Type'),
          value: state.filterType,
          onChanged: (AbsenceType? newValue) {
            if (newValue != null && newValue != state.filterType) {
              context.read<AbsencesCubit>().loadAbsences(type: newValue, date: state.filterDate);
            }
          },
          items: AbsenceType.values.map((AbsenceType type) {
            return DropdownMenuItem<AbsenceType>(
              value: type,
              child: Text(type.toString().split('.').last),
            );
          }).toList(),
        );
      },
    );
  }
}
