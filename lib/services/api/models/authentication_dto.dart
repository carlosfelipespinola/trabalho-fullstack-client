
class AuthenticationDto {
  final String email;
  final String password;

  AuthenticationDto({
    required this.email,
    required this.password,
  });

  Map<String, String> toMap() {
    return {
      'email': email,
      'password': password
    };
  }
}
