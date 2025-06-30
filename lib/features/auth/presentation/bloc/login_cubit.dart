import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registerapp/features/auth/data/models/request/login_request_model.dart';
import 'package:registerapp/features/auth/domain/usecases/login_usecases.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;

  LoginCubit(this.loginUseCase) : super(LoginInitial());

  Future<void> login(String username, String password) async {
    emit(LoginLoading());
    try {
      final request = LoginRequestModel(username: username, password: password);
      final user = await loginUseCase.execute(request);
      emit(LoginSuccess(user));
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}
