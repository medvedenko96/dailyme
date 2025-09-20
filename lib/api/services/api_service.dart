import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user_registration_request.dart';
import '../models/user_registration_response.dart';

class ApiService {
  static const String baseUrl = 'https://your-api-domain.com/api'; // Replace with your actual API URL
  
  static Future<UserRegistrationResponse> registerUser(UserRegistrationRequest request) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/register'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(request.toJson()),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        return UserRegistrationResponse.fromJson(responseData);
      } else {
        // Handle error response
        final Map<String, dynamic> errorData = jsonDecode(response.body);
        return UserRegistrationResponse(
          success: false,
          message: errorData['message'] ?? 'Registration failed',
        );
      }
    } catch (e) {
      return UserRegistrationResponse(
        success: false,
        message: 'Network error: ${e.toString()}',
      );
    }
  }
}
