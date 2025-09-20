class UserRegistrationResponse {
  final bool success;
  final String message;
  final String? userId;
  final String? token;

  UserRegistrationResponse({
    required this.success,
    required this.message,
    this.userId,
    this.token,
  });

  factory UserRegistrationResponse.fromJson(Map<String, dynamic> json) {
    return UserRegistrationResponse(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      userId: json['userId'],
      token: json['token'],
    );
  }
}
