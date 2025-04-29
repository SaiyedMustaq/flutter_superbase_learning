import 'package:supabase_flutter/supabase_flutter.dart';

class AuthApi {
  final SupabaseClient supabaseClient;

  AuthApi(this.supabaseClient);

  Future<AuthResponse> login({
    required String email,
    required String password,
  }) async {
    final AuthResponse response = await supabaseClient.auth.signInWithPassword(
      email: email,
      password: password,
    );
    return response;
  }

  Future<AuthResponse?> signUp(
      {required String email,
      required String password,
      required String name}) async {
    AuthResponse? response;
    try {
      final AuthResponse res = await supabaseClient.auth.signUp(
          email: email.toString(),
          password: password.toString(),
          data: {"userName": name.toString()});

      response = res;
    } catch (e) {
      rethrow;
    }
    return response;
  }
  // Implement sign-up logic
}

void signOut() {
  // Implement sign-out logic
}
