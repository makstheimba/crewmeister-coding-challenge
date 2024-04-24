import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/domain/models/absences.dart';
import 'package:frontend/presentation/absences/view/absences_table_filters.dart';
import 'package:mocktail/mocktail.dart';

import '../../../helpers/pump_app.dart';
import '../../../mocks/function_mock.dart';

void main() {
  final mockAbsences = [
    Absence(
      id: 1,
      userId: 1,
      type: AbsenceType.sickness,
      startDate: DateTime.now(),
      endDate: DateTime.now(),
      createdAt: DateTime.now(),
      crewId: 1,
    ),
  ];

  group('AbsencesTableFilters', () {
    testWidgets('Dropdown menu should show all absence types', (WidgetTester tester) async {
      await tester.pumpApp(
        AbsencesTableFilters(
          onExportToICal: () {},
          onFilterDateChanged: (date) {},
          onFilterTypeChanged: (type) {},
          onClearFilters: () {},
          filterDate: null,
          filterType: null,
          absences: mockAbsences,
        ),
      );

      await tester.tap(find.byType(DropdownButton<AbsenceType>));
      await tester.pumpAndSettle();

      for (final type in AbsenceType.values) {
        expect(find.text(type.toString().split('.').last), findsOneWidget);
      }
    });
  });

  group('Clear filters button', () {
    testWidgets('should not be visible while there is no filters', (WidgetTester tester) async {
      await tester.pumpApp(
        AbsencesTableFilters(
          onExportToICal: () {},
          onFilterDateChanged: (date) {},
          onFilterTypeChanged: (type) {},
          onClearFilters: () {},
          filterDate: null,
          filterType: null,
          absences: mockAbsences,
        ),
      );

      expect(find.text('Clear Filters'), findsNothing);
    });

    testWidgets('should call onClearFilters on tap', (widgetTester) async {
      final onClearFilters = MockFunction();

      await widgetTester.pumpApp(
        AbsencesTableFilters(
          onExportToICal: () {},
          onFilterDateChanged: (date) {},
          onFilterTypeChanged: (type) {},
          onClearFilters: onClearFilters.call,
          filterDate: DateTime.now(),
          filterType: AbsenceType.sickness,
          absences: mockAbsences,
        ),
      );

      await widgetTester.tap(find.text('Clear Filters'));
      verify(onClearFilters.call).called(1);
    });
  });

  group('iCal button', () {
    testWidgets('should not be visible when there is nothing to export', (WidgetTester tester) async {
      await tester.pumpApp(
        AbsencesTableFilters(
          onExportToICal: () {},
          onFilterDateChanged: (date) {},
          onFilterTypeChanged: (type) {},
          onClearFilters: () {},
          filterDate: null,
          filterType: null,
          absences: const [],
        ),
      );

      expect(find.text('Export to iCal'), findsNothing);
    });

    testWidgets('should call onExportToICal when there are absences to export', (widgetTester) async {
      final onExportToICal = MockFunction();

      await widgetTester.pumpApp(
        AbsencesTableFilters(
          onExportToICal: onExportToICal.call,
          onFilterDateChanged: (date) {},
          onFilterTypeChanged: (type) {},
          onClearFilters: () {},
          filterDate: null,
          filterType: null,
          absences: mockAbsences,
        ),
      );

      await widgetTester.tap(find.text('Export to iCal'));
      verify(onExportToICal.call).called(1);
    });
  });
}
