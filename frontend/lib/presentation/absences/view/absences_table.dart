import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/domain/models/absences.dart';
import 'package:frontend/domain/models/user.dart';
import 'package:frontend/presentation/absences/cubit/absences_cubit.dart';
import 'package:frontend/presentation/absences/cubit/absences_state.dart';
import 'package:intl/intl.dart';

class AbsencesTable extends StatelessWidget {
  const AbsencesTable({required this.users, super.key});
  final HashMap<int, UserModel> users;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Absences')),
      body: Column(
        children: [
          _buildFilters(),
          Expanded(child: _buildAbsencesTable()),
        ],
      ),
    );
  }

  Widget _buildFilters() {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: <Widget>[
          Expanded(child: _buildDateSelector()),
          const SizedBox(width: 10),
          Expanded(child: _buildTypeFilter()),
        ],
      ),
    );
  }

  Widget _buildDateSelector() {
    return BlocBuilder<AbsencesCubit, AbsencesState>(
      builder: (context, state) {
        return ListTile(
          title: const Text('Select Date:'),
          trailing: IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: () async {
              final cubit = context.read<AbsencesCubit>();
              final picked = await showDatePicker(
                context: context,
                initialDate: state.filterDate ?? DateTime(2021),
                firstDate: DateTime(2021),
                lastDate: DateTime(2022),
              );
              if (picked != null && picked != state.filterDate) {
                await cubit.loadAbsences(date: picked);
              }
            },
          ),
        );
      },
    );
  }

  Widget _buildTypeFilter() {
    return BlocBuilder<AbsencesCubit, AbsencesState>(
      builder: (context, state) {
        return DropdownButton<AbsenceType>(
          value: state.filterType,
          onChanged: (AbsenceType? newValue) {
            if (newValue != null) {
              context.read<AbsencesCubit>().loadAbsences(type: newValue);
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

  Widget _buildAbsencesTable() {
    return BlocBuilder<AbsencesCubit, AbsencesState>(
      builder: (context, state) {
        return Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: DataTable(
                  dataRowMaxHeight: double.infinity,
                  columnSpacing: 24,
                  columns: const <DataColumn>[
                    DataColumn(label: SizedBox(width: 60, child: Text('Name'))),
                    DataColumn(label: SizedBox(width: 50, child: Text('Type'))),
                    DataColumn(label: SizedBox(width: 200, child: Text('Period'))),
                    DataColumn(label: SizedBox(width: 150, child: Text('Member Note'))),
                    DataColumn(label: SizedBox(width: 50, child: Text('Status'))),
                    DataColumn(label: Text('Admitter Note')),
                  ],
                  rows: state.absences
                      .map<DataRow>(
                        (absence) => DataRow(
                          cells: <DataCell>[
                            DataCell(Text(users[absence.userId]?.name ?? 'id: ${absence.userId}')),
                            DataCell(Text(absence.type.toString().split('.').last)),
                            DataCell(
                              Text(
                                '${DateFormat('yyyy-MM-dd').format(absence.startDate)} - ${DateFormat('yyyy-MM-dd').format(absence.endDate)}',
                              ),
                            ),
                            DataCell(Text(absence.memberNote ?? 'N/A')),
                            DataCell(Text(absence.status.toString().split('.').last)),
                            DataCell(Text(absence.admitterNote ?? 'N/A')),
                          ],
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
            if (state.isLoading) const LinearProgressIndicator(),
            if (!state.isLoading && state.absences.length < state.total)
              TextButton(
                onPressed: () =>
                    context.read<AbsencesCubit>().loadAbsences(type: state.filterType, date: state.filterDate),
                child: const Text('Show More'),
              ),
          ],
        );
      },
    );
  }
}
