import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/data/api/absences_api.dart';
import 'package:frontend/domain/models/absences.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  late Dio dio;
  late DioAdapter dioAdapter;
  late AbsencesApi absencesApi;

  setUp(() {
    dio = Dio();
    dioAdapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
    absencesApi = AbsencesApi(dio);

    dio.httpClientAdapter = dioAdapter;
  });

  test('Fetches and maps absences correctly', () async {
    final absencesJson = File('test/mocks/absences_mock.json').readAsStringSync();
    final json = jsonDecode(absencesJson);

    dioAdapter.onGet(
      '/absences',
      (request) => request.reply(200, json),
      headers: {'Content-Type': 'application/json'},
    );

    final response = await absencesApi.getAbsences();

    expect(response.payload, isA<Absences>());
  });
}
