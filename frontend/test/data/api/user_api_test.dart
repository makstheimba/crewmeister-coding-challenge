import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/data/api/absences_api.dart';
import 'package:frontend/data/api/user_api.dart';
import 'package:frontend/domain/models/absences.dart';
import 'package:frontend/domain/models/user.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  late Dio dio;
  late DioAdapter dioAdapter;
  late UserApi userApi;
  late AbsencesApi absencesApi;

  setUp(() {
    dio = Dio();
    dioAdapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
    userApi = UserApi(dio);
    absencesApi = AbsencesApi(dio);

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

    final response = await absencesApi.getAbsences();

    expect(response.payload, isA<List<Absence>>());
  });
}
