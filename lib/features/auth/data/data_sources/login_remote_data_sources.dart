import 'package:dio/dio.dart';
import 'package:registerapp/core/services/api/api_end_points.dart';
import 'package:registerapp/features/auth/data/models/request/login_request_model.dart';
import 'package:registerapp/features/auth/data/models/response/login_response_model.dart';

abstract class LoginRemoteDataSource {
  Future<LoginResponseModel> login(LoginRequestModel request);
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final Dio dio;

  LoginRemoteDataSourceImpl(this.dio);

  @override
  Future<LoginResponseModel> login(LoginRequestModel request) async {
    try {
      final response = await dio.post(
           ApiEndPoints.login,
        data: request.toJson(),
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        }),
      );

      if (response.statusCode == 200) {
        return LoginResponseModel.fromJson(response.data);
      } else {
        throw Exception('Login failed: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Login exception: $e');
    }
  }
}
