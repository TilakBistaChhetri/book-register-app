import 'package:dio/dio.dart';
import 'package:registerapp/features/get_delete/data/models/response/get_response_model.dart';

class GetRemoteDataSource {
  final Dio dio;

  GetRemoteDataSource(this.dio);

  Future<GetModel> fetchGetData() async {
    final response = await dio.get('https://reqres.in/api/users?page=2');
    return GetModel.fromJson(response.data);
  }
}
