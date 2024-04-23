import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/domain/models/absences.dart';
import 'package:frontend/l10n/l10n.dart';
import 'package:frontend/presentation/absences/cubit/absences_cubit.dart';
import 'package:frontend/presentation/absences/cubit/absences_state.dart';
import 'package:intl/intl.dart';

class AbsencesTableFilters extends StatelessWidget {
  const AbsencesTableFilters({
    required this.onExportToICal,
    required this.onFilterDateChanged,
    required this.onFilterTypeChanged,
    required this.onClearFilters,
    super.key,
  });

  final VoidCallback onExportToICal;
  final ValueChanged<DateTime> onFilterDateChanged;
  final ValueChanged<AbsenceType> onFilterTypeChanged;
  final VoidCallback onClearFilters;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AbsencesCubit, AbsencesState>(
      builder: (context, state) {
        return Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      final picked = await showDatePicker(
                        context: context,
                        initialDate: state.filterDate ?? DateTime(2021),
                        firstDate: DateTime(2021),
                        lastDate: DateTime(2022),
                      );
                      if (picked != null && picked != state.filterDate) {
                        onFilterDateChanged(picked);
                      }
                    },
                    child: Text(
                      state.filterDate != null
                          ? DateFormat('yyyy-MM-dd').format(state.filterDate!)
                          : context.l10n.absencesTableFiltersDate,
                    ),
                  ),
                  const SizedBox(width: 16),
                  DropdownButton<AbsenceType>(
                    hint: Text(context.l10n.absencesTableFiltersType),
                    value: state.filterType,
                    focusColor: Colors.white,
                    onChanged: (AbsenceType? newValue) {
                      if (newValue != null && newValue != state.filterType) {
                        onFilterTypeChanged(newValue);
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
                      onPressed: onClearFilters,
                      child: Text(context.l10n.absencesTableFiltersClear),
                    ),
                ],
              ),
            ),
            if (state.absences.isNotEmpty && kIsWeb)
              ElevatedButton(
                onPressed: onExportToICal,
                child: Text(context.l10n.absencesTableFiltersICal),
              ),
          ],
        );
      },
    );
  }
}
