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
      appBar: AppBar(title: Text('Absences')),
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
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Expanded(child: _buildDateSelector()),
          SizedBox(width: 10),
          Expanded(child: _buildTypeFilter()),
        ],
      ),
    );
  }

  Widget _buildDateSelector() {
    return BlocBuilder<AbsencesCubit, AbsencesState>(
      builder: (context, state) {
        return ListTile(
          title: Text('Select Date:'),
          trailing: IconButton(
            icon: Icon(Icons.calendar_today),
            onPressed: () async {
              final cubit = context.read<AbsencesCubit>();
              final DateTime? picked = await showDatePicker(
                context: context,
                initialDate: state.filterDate ?? DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
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
            _tableHeader(),
            Expanded(
              child: ListView.builder(
                itemCount: state.absences.length,
                itemBuilder: (context, index) => _tableRow(state.absences[index]),
              ),
            ),
            if (state.isLoading) LinearProgressIndicator(),
            if (!state.isLoading && state.absences.length < state.total)
              TextButton(
                onPressed: () =>
                    context.read<AbsencesCubit>().loadAbsences(type: state.filterType, date: state.filterDate),
                child: Text('Show More'),
              ),
          ],
        );
      },
    );
  }

  Widget _tableHeader() {
    return Row(
      children: <Widget>[
        Expanded(child: Text('Member Name')),
        Expanded(child: Text('Type of Absence')),
        Expanded(child: Text('Period')),
        Expanded(child: Text('Member Note')),
        Expanded(child: Text('Status')),
        Expanded(child: Text('Admitter Note')),
      ],
    );
  }

  Widget _tableRow(Absence absence) {
    return Row(
      children: <Widget>[
        Expanded(child: Text(users[absence.userId]?.name ?? absence.userId.toString())),
        Expanded(child: Text(absence.type.toString().split('.').last)),
        Expanded(
          child: Text(
              '${DateFormat('yyyy-MM-dd').format(absence.startDate)} - ${DateFormat('yyyy-MM-dd').format(absence.endDate)}'),
        ),
        Expanded(child: Text(absence.memberNote ?? 'N/A')),
        Expanded(child: Text(absence.status.toString().split('.').last)),
        Expanded(child: Text(absence.admitterNote ?? 'N/A')),
      ],
    );
  }
}
