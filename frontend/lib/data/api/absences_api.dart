import 'package:dio/dio.dart';
import 'package:frontend/data/api/api_response.dart';
import 'package:frontend/domain/models/absences.dart';
import 'package:retrofit/retrofit.dart';

part 'absences_api.g.dart';

@RestApi(baseUrl: 'https://nhz2w8h2eb.execute-api.eu-north-1.amazonaws.com/')
abstract class AbsencesApi {
  factory AbsencesApi(Dio dio, {String baseUrl}) = _AbsencesApi;

  @GET('/absences')
  Future<ApiResponse<List<Absence>>> getAbsences({
    @Query('page') int? page,
    @Query('type') String? type,
    @Query('date') String? date,
  });
}
