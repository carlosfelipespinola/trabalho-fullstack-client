
import 'package:client/services/api/models/authenticated_user_dto.dart';

abstract class AuthCubitState {}

class AuthCubitBusy extends AuthCubitState {}

class AuthCubitError extends AuthCubitState {}

class AuthCubitAuthenticationRequired extends AuthCubitState {}

class AuthCubitAuthenticated extends AuthCubitState {
  final AuthenticatedUserDto authenticatedUser;

  AuthCubitAuthenticated({
    required this.authenticatedUser,
  });
}
