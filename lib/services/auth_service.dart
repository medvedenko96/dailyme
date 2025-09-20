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
      // Simulate API call delay
      await Future.delayed(const Duration(seconds: 2));
      
      // Simple validation - in a real app, this would be an API call
      if (email.isNotEmpty && password.length >= 6 && name.isNotEmpty && weight.isNotEmpty && height.isNotEmpty) {
        _isAuthenticated = true;
        _currentUserEmail = email;
        return true;
      }
      
      throw Exception('Invalid user data');
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
