import 'package:flutter/material.dart';
import 'package:frontend/domain/models/absences.dart';
import 'package:frontend/l10n/l10n.dart';
import 'package:intl/intl.dart';

class AbsencesTableFilters extends StatelessWidget {
  const AbsencesTableFilters({
    required this.onFilterDateChanged,
    required this.onFilterTypeChanged,
    required this.onClearFilters,
    required this.filterDate,
    required this.filterType,
    required this.absences,
    this.onExportToICal,
    super.key,
  });

  final VoidCallback? onExportToICal;
  final ValueChanged<DateTime> onFilterDateChanged;
  final ValueChanged<AbsenceType> onFilterTypeChanged;
  final VoidCallback onClearFilters;

  final DateTime? filterDate;
  final AbsenceType? filterType;
  final List<Absence> absences;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: filterDate ?? DateTime(2021),
                    firstDate: DateTime(2021),
                    lastDate: DateTime(2022),
                  );
                  if (picked != null && picked != filterDate) {
                    onFilterDateChanged(picked);
                  }
                },
                child: Text(
                  filterDate != null
                      ? DateFormat('yyyy-MM-dd').format(filterDate!)
                      : context.l10n.absencesTableFiltersDate,
                ),
              ),
              const SizedBox(width: 16),
              DropdownButton<AbsenceType>(
                hint: Text(context.l10n.absencesTableFiltersType),
                value: filterType,
                focusColor: Colors.white,
                onChanged: (AbsenceType? newValue) {
                  if (newValue != null && newValue != filterType) {
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
              if (filterDate != null || filterType != null)
                ElevatedButton(
                  onPressed: onClearFilters,
                  child: Text(context.l10n.absencesTableFiltersClear),
                ),
            ],
          ),
        ),
        if (absences.isNotEmpty && onExportToICal != null)
          ElevatedButton(
            onPressed: onExportToICal,
            child: Text(context.l10n.absencesTableFiltersICal),
          ),
      ],
    );
  }
}
