class UserRegistrationRequest {
  final String email;
  final String password;
  final String name;
  final String weight;
  final String height;

  UserRegistrationRequest({
    required this.email,
    required this.password,
    required this.name,
    required this.weight,
    required this.height,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'name': name,
      'weight': weight,
      'height': height,
    };
  }
}
