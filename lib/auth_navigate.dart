import 'package:flutter/material.dart';
import 'package:flutter_superbase_learning/login_screen.dart';
import 'package:flutter_superbase_learning/profile_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthNavigateScreen extends StatelessWidget {
  const AuthNavigateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Supabase.instance.client.auth.onAuthStateChange,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final session = snapshot.data?.session;
          if (session != null) {
            return const ProfileScreen();
          }else{
            return const LoginScreen();
          }
        });
  }
}
