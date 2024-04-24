import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/domain/models/absences.dart';

void main() {
  group('AbsenceModel', () {
    late Absence mockAbsence;

    setUp(() {
      mockAbsence = Absence(
        id: 1,
        userId: 1,
        type: AbsenceType.sickness,
        startDate: DateTime(2021),
        endDate: DateTime(2021, 1, 2),
        createdAt: DateTime(2021),
        crewId: 1,
      );
    });
    test('should correctly format Absence to iCal', () {
      final result = mockAbsence.formatToICal('John Doe');
      final components = [
        'BEGIN:VEVENT',
        'UID:1+1+1',
        'DTSTAMP:20201231T230000Z',
        'DTSTART:20201231T230000Z',
        'DTEND:20210101T230000Z',
        'SUMMARY:Absence of John Doe from Crew 1',
        r'DESCRIPTION:Type:sickness \nMemberNote: \nAdmitterNote: ',
        'END:VEVENT',
      ];

      expect(result, components.join('\r\n'));
    });

    group('AbsenceModel status', () {
      test('should return confirmed when confirmedAt is not null', () {
        expect(mockAbsence.copyWith(rejectedAt: null, confirmedAt: DateTime.now()).status, AbsenceStatus.confirmed);
      });
      test('should return rejected when rejectedAt is not null', () {
        expect(mockAbsence.copyWith(rejectedAt: DateTime.now(), confirmedAt: null).status, AbsenceStatus.rejected);
      });
      test('should return requested when confirmedAt and rejectedAt are null', () {
        expect(mockAbsence.copyWith(rejectedAt: null, confirmedAt: null).status, AbsenceStatus.requested);
      });
    });
  });
}
