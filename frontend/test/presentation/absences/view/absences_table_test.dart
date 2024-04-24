import 'dart:collection';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/domain/models/absences.dart';
import 'package:frontend/domain/models/user.dart';
import 'package:frontend/presentation/absences/cubit/absences_cubit.dart';
import 'package:frontend/presentation/absences/cubit/absences_state.dart';
import 'package:frontend/presentation/absences/view/absences_table.dart';
import 'package:frontend/presentation/absences/view/absences_table_filters.dart';
import 'package:mocktail/mocktail.dart';

import '../../../helpers/pump_app.dart';

class MockAbsencesCubit extends MockCubit<AbsencesState> implements AbsencesCubit {}

void main() {
  group('AbsencesTable', () {
    late AbsencesCubit absencesCubit;
    final users = HashMap<int, User>();

    setUp(() {
      absencesCubit = MockAbsencesCubit();
      users[0] = const User(id: 0, name: 'John Doe', image: 'url', userId: 0, crewId: 0);
    });

    testWidgets('renders AbsencesTable', (tester) async {
      when(() => absencesCubit.state).thenReturn(const AbsencesState());
      await tester.pumpApp(
        BlocProvider.value(
          value: absencesCubit,
          child: AbsencesTable(users: users),
        ),
      );
      expect(find.byType(AbsencesTable), findsOneWidget);
    });

    testWidgets('renders AbsencesTableFilters', (tester) async {
      when(() => absencesCubit.state).thenReturn(const AbsencesState());
      await tester.pumpApp(
        BlocProvider.value(
          value: absencesCubit,
          child: AbsencesTable(users: users),
        ),
      );
      expect(find.byType(AbsencesTableFilters), findsOneWidget);
    });

    testWidgets('calls loadAbsences when try again button is tapped', (tester) async {
      when(() => absencesCubit.state).thenReturn(const AbsencesState(errorMessage: 'Error'));
      when(() => absencesCubit.loadAbsences()).thenAnswer((_) {
        return Future.value();
      });
      await tester.pumpApp(
        BlocProvider.value(
          value: absencesCubit,
          child: AbsencesTable(users: users),
        ),
      );
      await tester.tap(find.text('Try Again'));
      verify(() => absencesCubit.loadAbsences()).called(1);
    });

    testWidgets('renders absences table when absences are not empty', (tester) async {
      final absences = [
        Absence(
          id: 0,
          userId: 0,
          startDate: DateTime.now(),
          endDate: DateTime.now(),
          type: AbsenceType.sickness,
          crewId: 1,
          createdAt: DateTime.now(),
        ),
      ];
      when(() => absencesCubit.state).thenReturn(AbsencesState(absences: absences));
      await tester.pumpApp(
        BlocProvider.value(
          value: absencesCubit,
          child: AbsencesTable(users: users),
        ),
      );
      expect(find.byType(DataTable), findsOneWidget);
      expect(find.text(users[0]!.name), findsOneWidget);
    });
  });
}
