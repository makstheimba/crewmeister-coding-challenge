import 'package:dio/dio.dart';
import 'package:frontend/data/api/api_response.dart';
import 'package:frontend/domain/models/user.dart';
import 'package:retrofit/retrofit.dart';

part 'user_api.g.dart';

@RestApi(baseUrl: 'https://nhz2w8h2eb.execute-api.eu-north-1.amazonaws.com/')
abstract class UserApi {
  factory UserApi(Dio dio) = _UserApi;

  @GET('/users')
  Future<ApiResponse<List<UserModel>>> getUsers();
}
