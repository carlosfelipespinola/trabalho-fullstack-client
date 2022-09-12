
class AuthenticationRegisterDto {
  final String name;
  final String email;
  final String password;
  
  AuthenticationRegisterDto({
    required this.name,
    required this.email,
    required this.password,
  });

  Map<String, String> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password
    };
  }
}
