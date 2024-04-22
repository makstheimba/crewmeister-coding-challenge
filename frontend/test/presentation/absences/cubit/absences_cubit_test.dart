import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/data/api/absences_api.dart';
import 'package:frontend/data/api/api_response.dart';
import 'package:frontend/domain/models/absences.dart';
import 'package:frontend/presentation/absences/cubit/absences_cubit.dart';
import 'package:frontend/presentation/absences/cubit/absences_state.dart';
import 'package:mocktail/mocktail.dart';

class MockAbsencesApi extends Mock implements AbsencesApi {}

void main() {
  group('AbsencesCubit', () {
    late MockAbsencesApi mockAbsencesApi;
    late AbsencesCubit absencesCubit;
    late List<Absence> absencesMock;

    setUp(() {
      mockAbsencesApi = MockAbsencesApi();
      absencesCubit = AbsencesCubit(mockAbsencesApi);
      absencesMock = List.generate(11, (index) {
        return Absence(
          crewId: 2,
          id: index + 1,
          userId: 1,
          createdAt: DateTime.now(),
          startDate: DateTime.now(),
          endDate: DateTime.now(),
          type: AbsenceType.sickness,
        );
      });
    });

    tearDown(() {
      absencesCubit.close();
    });

    test('initial state is correct', () {
      expect(absencesCubit.state, const AbsencesState());
    });

    blocTest<AbsencesCubit, AbsencesState>(
      'emits [loading, loaded] when absences are successfully fetched',
      build: () => absencesCubit,
      act: (cubit) {
        when(
          () => mockAbsencesApi.getAbsences(
            page: 1,
            type: any(named: 'type'),
            date: any(named: 'date'),
          ),
        ).thenAnswer(
          (_) async => ApiResponse(
            message: '',
            payload: Absences(list: absencesMock.sublist(0, 10), total: absencesMock.length),
          ),
        );
        cubit.loadAbsences();
      },
      expect: () => [
        isA<AbsencesState>()
            .having((s) => s.isLoading, 'isLoading', true)
            .having((s) => s.absences, 'absences', isEmpty),
        isA<AbsencesState>()
            .having((s) => s.isLoading, 'isLoading', false)
            .having((s) => s.absences, 'absences', isNotEmpty)
            .having((s) => s.total, 'total', absencesMock.length),
      ],
    );

    blocTest<AbsencesCubit, AbsencesState>(
      'emits [loading(0), loaded(10), isLoading(10), loaded(11)] when absences are fetched with the same filter',
      build: () => absencesCubit,
      act: (cubit) async {
        when(
          () => mockAbsencesApi.getAbsences(
            page: 1,
            type: any(named: 'type'),
            date: any(named: 'date'),
          ),
        ).thenAnswer(
          (_) async => ApiResponse(
            message: '',
            payload: Absences(list: absencesMock.sublist(0, 10), total: absencesMock.length),
          ),
        );
        when(
          () => mockAbsencesApi.getAbsences(
            page: 2,
            type: any(named: 'type'),
            date: any(named: 'date'),
          ),
        ).thenAnswer(
          (_) async => ApiResponse(
            message: '',
            payload: Absences(list: absencesMock.sublist(10), total: absencesMock.length),
          ),
        );
        await cubit.loadAbsences();
        await cubit.loadAbsences();
      },
      expect: () => [
        isA<AbsencesState>()
            .having((s) => s.isLoading, 'isLoading', true)
            .having((s) => s.absences, 'absences', isEmpty),
        isA<AbsencesState>()
            .having((s) => s.isLoading, 'isLoading', false)
            .having((s) => s.absences.length, 'absences', 10)
            .having((s) => s.total, 'total', absencesMock.length),
        isA<AbsencesState>()
            .having((s) => s.isLoading, 'isLoading', true)
            .having((s) => s.absences.length, 'absences', 10)
            .having((s) => s.total, 'total', absencesMock.length),
        isA<AbsencesState>()
            .having((s) => s.isLoading, 'isLoading', false)
            .having((s) => s.absences.length, 'absences', 11)
            .having((s) => s.total, 'total', absencesMock.length),
      ],
    );

    blocTest<AbsencesCubit, AbsencesState>(
      'emits [loading(0), loaded(10), loading(0), loaded(0)] when absences are fetched with different filter',
      build: () => absencesCubit,
      act: (cubit) async {
        when(
          () => mockAbsencesApi.getAbsences(
            page: 1,
            type: AbsenceType.sickness.toJsonString(),
            date: any(named: 'date'),
          ),
        ).thenAnswer(
          (_) async => ApiResponse(
            message: '',
            payload: Absences(list: absencesMock.sublist(0, 10), total: absencesMock.length),
          ),
        );
        when(
          () => mockAbsencesApi.getAbsences(
            page: 1,
            type: AbsenceType.vacation.toJsonString(),
            date: any(named: 'date'),
          ),
        ).thenAnswer(
          (_) async => ApiResponse(
            message: '',
            payload: Absences(list: [absencesMock[0]], total: 1),
          ),
        );
        await cubit.loadAbsences(type: AbsenceType.sickness);
        await cubit.loadAbsences(type: AbsenceType.vacation);
      },
      expect: () => [
        isA<AbsencesState>()
            .having((s) => s.isLoading, 'isLoading', true)
            .having((s) => s.absences, 'absences', isEmpty),
        isA<AbsencesState>()
            .having((s) => s.isLoading, 'isLoading', false)
            .having((s) => s.absences.length, 'absences', 10)
            .having((s) => s.total, 'total', absencesMock.length),
        isA<AbsencesState>()
            .having((s) => s.isLoading, 'isLoading', true)
            .having((s) => s.absences, 'absences', isEmpty)
            .having((s) => s.total, 'total', 0),
        isA<AbsencesState>()
            .having((s) => s.isLoading, 'isLoading', false)
            .having((s) => s.absences.length, 'absences', 1)
            .having((s) => s.total, 'total', 1),
      ],
    );

    blocTest<AbsencesCubit, AbsencesState>(
      'emits [isLoading, error] when fetching absences fails',
      build: () => absencesCubit,
      act: (cubit) {
        when(
          () => mockAbsencesApi.getAbsences(
            page: any(named: 'page'),
            type: any(named: 'type'),
            date: any(named: 'date'),
          ),
        ).thenThrow(Exception('Failed to fetch absences'));
        cubit.loadAbsences();
      },
      expect: () => [
        isA<AbsencesState>()
            .having((s) => s.isLoading, 'isLoading', true)
            .having((s) => s.absences, 'absences', isEmpty),
        isA<AbsencesState>()
            .having((s) => s.isLoading, 'isLoading', false)
            .having((s) => s.errorMessage, 'errorMessage', Exception('Failed to fetch absences').toString()),
      ],
    );
  });
}
