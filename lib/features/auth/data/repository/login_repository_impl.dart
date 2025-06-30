import 'package:registerapp/features/auth/data/data_sources/login_remote_data_sources.dart';
import 'package:registerapp/features/auth/data/models/request/login_request_model.dart';
import 'package:registerapp/features/auth/domain/entity/login_entity.dart';
import 'package:registerapp/features/auth/domain/repository/login_repository.dart';

class LoginRepositoryImpl extends LoginRepository {
  final LoginRemoteDataSource remoteDataSource;

  LoginRepositoryImpl(this.remoteDataSource);

  @override
  Future<LoginEntity> login(LoginRequestModel request) async {
    final response = await remoteDataSource.login(request);
    
    return LoginEntity(
      username: response.user?.username,
      email: response.user?.email,
    );
  }
}
