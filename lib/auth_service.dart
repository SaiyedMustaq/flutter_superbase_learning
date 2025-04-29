import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  AuthService._privateConstructor();
  static final AuthService _instance = AuthService._privateConstructor();
  static AuthService get instance => _instance;

  static final SupabaseClient _superBaseClient = Supabase.instance.client;

  //Logins user with email and password
  static Future<AuthResponse> signInWithEmailPassword({
    required String email,
    required String password,
  }) async {
    return await _superBaseClient.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  //Registers user with email and password
  static Future<AuthResponse> signUpWithEmailPassword({
    required String email,
    required String password,
  }) async {
    return await _superBaseClient.auth.signUp(
      email: email,
      password: password,
    );
  }

  //signout user
  static Future<void> signOut() async {
    await _superBaseClient.auth.signOut();
  }

  // Get current user email
  static String? getCurrentUserEmail() {
    return _superBaseClient.auth.currentUser?.email;
  }
}
