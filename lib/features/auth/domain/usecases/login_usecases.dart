import 'package:registerapp/features/auth/domain/entity/login_entity.dart';
import 'package:registerapp/features/auth/domain/repository/login_repository.dart';
import 'package:registerapp/features/auth/data/models/request/login_request_model.dart';

class LoginUseCase {
  final LoginRepository repository;

  LoginUseCase(this.repository);

  Future<LoginEntity> execute(LoginRequestModel request) {
    return repository.login(request);
  }
}
