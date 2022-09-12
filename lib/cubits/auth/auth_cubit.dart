
import 'package:client/cubits/auth/auth_cubit_state.dart';
import 'package:client/services/api/auth.dart';
import 'package:client/services/api/models/authentication_dto.dart';
import 'package:client/services/api/models/authentication_register_dto.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthCubitState> {

  final Auth _authService;

  AuthCubit(
    AuthCubitState initialState,
    { required Auth authService }
  ) : _authService = authService, super(initialState);

  void login(AuthenticationDto authenticationData) async {
    try {
      emit(AuthCubitBusy());
      await _authService.login(authenticationData);
      if (_authService.isAuthenticated) {
        emit(AuthCubitAuthenticated(authenticatedUser: _authService.user));
      }
    } catch (_) {
      emit(AuthCubitError());
    }
  }

  void register(AuthenticationRegisterDto authenticationRegisterData) async {
    try {
      emit(AuthCubitBusy());
      await _authService.register(authenticationRegisterData);
      if (_authService.isAuthenticated) {
        emit(AuthCubitAuthenticated(authenticatedUser: _authService.user));
      }
    } catch (_) {
      emit(AuthCubitError());
    }
  }

  void logout() {
    _authService.logout();
    emit(AuthCubitAuthenticationRequired());
  }
}