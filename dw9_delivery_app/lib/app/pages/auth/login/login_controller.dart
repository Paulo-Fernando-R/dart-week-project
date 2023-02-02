import 'dart:developer';
import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:dw9_delivery_app/app/core/exceptions/unauthorized_exception.dart';
import 'package:dw9_delivery_app/app/models/auth_model.dart';
import 'package:dw9_delivery_app/app/pages/auth/login/login_state.dart';
import 'package:dw9_delivery_app/app/repositories/auth/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends Cubit<LoginState> {
  final AuthRepository _authRepository;
  LoginController(this._authRepository) : super(const LoginState.initial());

  Future<void> login(String email, String password) async {
    try {
      emit(state.copyWith(status: LoginStatus.login));
      final AuthModel = await _authRepository.login(email, password);
      final sp = await SharedPreferences.getInstance();
      sp.setString('accessToken', AuthModel.accessToken);
      sp.setString('refreshToken', AuthModel.refreshToken);
      emit(
        state.copyWith(status: LoginStatus.sucess),
      );
    } on UnauthorizedException catch (e, s) {
      emit(
        state.copyWith(
          status: LoginStatus.loginError,
          errorMessage: 'Login ou senha inválidos',
        ),
      );
      log('Login ou senha inválidos', error: e, stackTrace: s);
    } catch (e, s) {
      state.copyWith(
        status: LoginStatus.error,
        errorMessage: 'Erro ao realizar p login',
      );
      log('Erro ao realizar o login', error: e, stackTrace: s);
    }
  }
}
