import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/domain/models/user.dart';
import 'package:frontend/presentation/absences/cubit/absences_cubit.dart';
import 'package:frontend/presentation/absences/cubit/absences_state.dart';
import 'package:frontend/presentation/absences/view/absences_table_filters.dart';
import 'package:intl/intl.dart';

class AbsencesTable extends StatefulWidget {
  const AbsencesTable({required this.users, super.key});
  final HashMap<int, UserModel> users;

  @override
  State<AbsencesTable> createState() => _AbsencesTableState();
}

class _AbsencesTableState extends State<AbsencesTable> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    context.read<AbsencesCubit>().stream.listen((state) {
      if (state.isLoading == false) {
        if (_scrollController.hasClients) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            _scrollController.animateTo(
              _scrollController.position.maxScrollExtent,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
            );
          });
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Absences')),
      body: Column(
        children: [
          Container(padding: const EdgeInsets.all(8), child: const AbsencesTableFilters()),
          Expanded(child: _buildAbsencesTable()),
        ],
      ),
    );
  }

  Widget _buildAbsencesTable() {
    return BlocBuilder<AbsencesCubit, AbsencesState>(
      builder: (context, state) {
        return Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: DataTable(
                  dataRowMaxHeight: double.infinity,
                  columnSpacing: 24,
                  columns: const <DataColumn>[
                    DataColumn(label: SizedBox(width: 60, child: Text('Name'))),
                    DataColumn(label: SizedBox(width: 50, child: Text('Type'))),
                    DataColumn(label: SizedBox(width: 200, child: Text('Period'))),
                    DataColumn(label: SizedBox(width: 150, child: Text('Member Note'))),
                    DataColumn(label: SizedBox(width: 50, child: Text('Status'))),
                    DataColumn(label: SizedBox(width: 100, child: Text('Admitter Note'))),
                  ],
                  rows: state.absences
                      .map<DataRow>(
                        (absence) => DataRow(
                          cells: <DataCell>[
                            DataCell(Text(widget.users[absence.userId]?.name ?? 'id: ${absence.userId}')),
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
            const SizedBox(height: 16),
            if (state.isLoading) const LinearProgressIndicator(),
            if (!state.isLoading && state.absences.length < state.total)
              TextButton(
                onPressed: () =>
                    context.read<AbsencesCubit>().loadAbsences(type: state.filterType, date: state.filterDate),
                child: const Text('Show More'),
              ),
            const SizedBox(height: 16),
          ],
        );
      },
    );
  }
}
