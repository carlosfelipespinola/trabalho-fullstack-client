class AuthenticatedUserDto {
  String email;

  AuthenticatedUserDto({
    required this.email,
  });

  factory AuthenticatedUserDto.fromJson(Map<String, dynamic> map) {
    return AuthenticatedUserDto(
      email: map['email']
    );
  }
  
  String get id => email;
}
