
import 'package:client/services/api/models/authenticated_user_dto.dart';
import 'package:client/services/api/models/authentication_dto.dart';
import 'package:client/services/api/models/authentication_register_dto.dart';
import 'package:dio/dio.dart';

class Auth {
  final Dio _client = Dio(
    BaseOptions(baseUrl: 'https://tranquil-chamber-60071.herokuapp.com/user')
  );

  AuthenticatedUserDto? _authenticatedUserDto;

  bool get isAuthenticated => _authenticatedUserDto != null;

  /// available only when [isAuthenticated] is true
  AuthenticatedUserDto get user => _authenticatedUserDto!;

  Future<void> login(AuthenticationDto authenticationDto) async {
    final response = await _client.post(
      '/login',
      data: authenticationDto.toMap() 
    );
    if (response.statusCode == 200) {
      _authenticatedUserDto = AuthenticatedUserDto.fromJson(response.data as Map<String, dynamic>);
    }
  }

  Future<void> register(AuthenticationRegisterDto authenticationDto) async {
    final response = await _client.post(
      '/create',
      data: authenticationDto.toMap() 
    );
    if (response.statusCode == 200) {
      _authenticatedUserDto = AuthenticatedUserDto.fromJson(response.data as Map<String, dynamic>);
    }
  }

  void logout() {
    _authenticatedUserDto = null;
  }
}