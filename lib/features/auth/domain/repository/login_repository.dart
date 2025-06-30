import 'package:registerapp/features/auth/data/models/request/login_request_model.dart' show LoginRequestModel;
import 'package:registerapp/features/auth/domain/entity/login_entity.dart';

abstract class LoginRepository {
  Future<LoginEntity> login(LoginRequestModel request);
}


