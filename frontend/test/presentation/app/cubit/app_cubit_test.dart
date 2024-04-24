import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/data/api/api_response.dart';
import 'package:frontend/data/api/user_api.dart';
import 'package:frontend/domain/models/user.dart';
import 'package:frontend/presentation/app/cubit/app_cubit.dart';
import 'package:frontend/presentation/app/cubit/app_state.dart';
import 'package:mocktail/mocktail.dart';

class MockUserApi extends Mock implements UserApi {}

void main() {
  group('AppCubit', () {
    late MockUserApi mockUserApi;
    late AppCubit appCubit;

    setUp(() {
      mockUserApi = MockUserApi();
      appCubit = AppCubit(mockUserApi);
    });

    tearDown(() {
      appCubit.close();
    });

    test('initial state is AppState.initial()', () {
      expect(appCubit.state, const AppState.initial());
    });

    blocTest<AppCubit, AppState>(
      'emits [AppState.loading, AppState.loaded] when users are successfully fetched',
      build: () => appCubit,
      act: (cubit) {
        when(() => mockUserApi.getUsers()).thenAnswer(
          (_) async => ApiResponse(
            payload: [const User(id: 1, name: 'John Doe', image: 'url', userId: 1, crewId: 1)],
            message: '',
          ),
        );
        cubit.initialize();
      },
      expect: () => [
        const AppState.loading(),
        isA<AppState>().having(
          (s) => s.maybeWhen(
            loaded: (users) => users.containsKey(1) && users[1]?.name == 'John Doe',
            orElse: () => false,
          ),
          'loaded state with expected user',
          true,
        ),
      ],
    );

    blocTest<AppCubit, AppState>(
      'emits [AppState.loading, AppState.error] when fetching users fails',
      build: () => appCubit,
      act: (cubit) {
        when(() => mockUserApi.getUsers()).thenThrow(Exception('Failed to fetch users'));
        cubit.initialize();
      },
      expect: () => [
        const AppState.loading(),
        isA<AppState>().having(
          (s) => s.maybeWhen(
            error: (message) => message,
            orElse: () => '',
          ),
          'error state',
          'Exception: Failed to fetch users',
        ),
      ],
    );
  });
}
