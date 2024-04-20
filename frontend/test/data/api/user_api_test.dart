import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/data/api/user_api.dart';
import 'package:frontend/domain/models/user.dart';
import 'package:frontend/domain/models/user_absences.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  late Dio dio;
  late DioAdapter dioAdapter;
  late UserApi userApi;

  setUp(() {
    dio = Dio();
    dioAdapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
    userApi = UserApi(dio);

    dio.httpClientAdapter = dioAdapter;
  });

  test('Fetches and maps users correctly', () async {
    final usersJson = File('test/data/api/users_mock.json').readAsStringSync();
    final json = jsonDecode(usersJson);

    dioAdapter.onGet(
      '/users',
      (request) => request.reply(200, json),
      headers: {'Content-Type': 'application/json'},
    );

    final response = await userApi.getUsers();

    expect(response.payload, isA<List<UserModel>>());
  });

  test('Fetches and maps absences correctly', () async {
    final absencesJson = File('test/data/api/absences_mock.json').readAsStringSync();
    final json = jsonDecode(absencesJson);

    dioAdapter.onGet(
      '/absences',
      (request) => request.reply(200, json),
      headers: {'Content-Type': 'application/json'},
    );

    final response = await userApi.getAbsences();

    expect(response.payload, isA<List<UserAbsence>>());
  });
}
