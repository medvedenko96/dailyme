import '../api/services/api_service.dart';
import '../api/models/user_registration_request.dart';

class AuthService {
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;
  AuthService._internal();

  bool _isAuthenticated = false;
  String? _currentUserEmail;

  bool get isAuthenticated => _isAuthenticated;
  String? get currentUserEmail => _currentUserEmail;

  Future<bool> login(String email, String password) async {
    try {
      // Simulate API call delay
      await Future.delayed(const Duration(seconds: 2));
      
      // Simple validation - in a real app, this would be an API call
      if (email.isNotEmpty && password.length >= 6) {
        _isAuthenticated = true;
        _currentUserEmail = email;
        return true;
      }
      
      throw Exception('Invalid credentials');
    } catch (e) {
      throw Exception('Login failed: ${e.toString()}');
    }
  }

  Future<bool> signUp(String email, String password, String name, String weight, String height) async {
    try {
      final request = UserRegistrationRequest(
        email: email,
        password: password,
        name: name,
        weight: weight,
        height: height,
      );

      final response = await ApiService.registerUser(request);

      if (response.success) {
        _isAuthenticated = true;
        _currentUserEmail = email;
        return true;
      } else {
        throw Exception(response.message);
      }
    } catch (e) {
      throw Exception('Sign up failed: ${e.toString()}');
    }
  }

  void logout() {
    _isAuthenticated = false;
    _currentUserEmail = null;
  }

  Future<void> forgotPassword(String email) async {
    // Simulate API call delay
    await Future.delayed(const Duration(seconds: 1));
    
    // In a real app, this would send a password reset email
    if (email.isEmpty) {
      throw Exception('Please enter a valid email address');
    }
  }
}
