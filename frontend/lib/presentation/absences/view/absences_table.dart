import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/domain/models/absences.dart';
import 'package:frontend/domain/models/user.dart';
import 'package:frontend/l10n/l10n.dart';
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

  void _loadAbsences({AbsenceType? type, DateTime? date}) {
    context.read<AbsencesCubit>().loadAbsences(type: type, date: date);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1000),
        child: BlocBuilder<AbsencesCubit, AbsencesState>(
          builder: (context, state) {
            return Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  child: AbsencesTableFilters(
                    onExportToICal: () => context.read<AbsencesCubit>().exportToICal(widget.users),
                    onFilterDateChanged: (date) => _loadAbsences(date: date, type: state.filterType),
                    onFilterTypeChanged: (type) => _loadAbsences(date: state.filterDate, type: type),
                    onClearFilters: _loadAbsences,
                  ),
                ),
                Expanded(child: _buildAbsencesTable(context, state)),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildAbsencesTable(BuildContext context, AbsencesState state) {
    if (state.absences.isEmpty && state.errorMessage != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => context.read<AbsencesCubit>().loadAbsences(),
              child: Text(context.l10n.absencesTableTryAgain),
            ),
          ],
        ),
      );
    }
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            controller: _scrollController,
            child: DataTable(
              dataRowMaxHeight: double.infinity,
              columnSpacing: 24,
              columns: <DataColumn>[
                DataColumn(label: SizedBox(width: 60, child: Text(context.l10n.absencesTableHeadName))),
                DataColumn(label: SizedBox(width: 50, child: Text(context.l10n.absencesTableHeadType))),
                DataColumn(label: SizedBox(width: 200, child: Text(context.l10n.absencesTableHeadPeriod))),
                DataColumn(label: SizedBox(width: 140, child: Text(context.l10n.absencesTableHeadMemberNote))),
                DataColumn(label: SizedBox(width: 50, child: Text(context.l10n.absencesTableHeadStatus))),
                DataColumn(label: SizedBox(width: 100, child: Text(context.l10n.absencesTableHeadAdmitterNote))),
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
            onPressed: () => context.read<AbsencesCubit>().loadAbsences(type: state.filterType, date: state.filterDate),
            child: Text(context.l10n.absencesTableShowMore),
          ),
        const SizedBox(height: 16),
      ],
    );
  }
}
