import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/domain/models/absences.dart';
import 'package:frontend/presentation/absences/cubit/absences_cubit.dart';
import 'package:frontend/presentation/absences/cubit/absences_state.dart';
import 'package:intl/intl.dart';

class AbsencesTableFilters extends StatelessWidget {
  const AbsencesTableFilters({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AbsencesCubit, AbsencesState>(
      builder: (context, state) {
        return Row(
          children: <Widget>[
            ElevatedButton(
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
              child: Text(
                state.filterDate != null ? DateFormat('yyyy-MM-dd').format(state.filterDate!) : 'Filter by Date',
              ),
            ),
            const SizedBox(width: 16),
            DropdownButton<AbsenceType>(
              hint: const Text('Filter by Type'),
              value: state.filterType,
              focusColor: Colors.white,
              onChanged: (AbsenceType? newValue) {
                if (newValue != null && newValue != state.filterType) {
                  context.read<AbsencesCubit>().loadAbsences(type: newValue, date: state.filterDate);
                }
              },
              items: AbsenceType.values.map((AbsenceType type) {
                return DropdownMenuItem<AbsenceType>(
                  value: type,
                  child: SizedBox(width: 120, child: Text(type.toString().split('.').last)),
                );
              }).toList(),
            ),
            const SizedBox(width: 16),
            if (state.filterDate != null || state.filterType != null)
              ElevatedButton(
                onPressed: () => context.read<AbsencesCubit>().loadAbsences(),
                child: const Text('Clear filters'),
              ),
          ],
        );
      },
    );
  }
}
