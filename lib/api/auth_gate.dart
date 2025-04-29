/*

AUTH GATE API - This will control the authentication of the user auth state and will be used to control the navigation of the app

unauthorized - user is not logged in
authorized - user is logged in
*/

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_superbase_learning/features/auth/screen/sign_in_page.dart';
import 'package:flutter_superbase_learning/features/auth/screen/todo_screen.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../routes/route_name.dart';
import '../services/superbase_services.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  late final StreamSubscription<AuthState> _authSubscription;
  final SuperbaseServices services = Get.find<SuperbaseServices>();
  @override
  void initState() {
    _authSubscription =
        Supabase.instance.client.auth.onAuthStateChange.listen((data) {
      final session = data.session;
      if (session == null) {
        Get.toNamed(RouteName.signIn);
      } else {
        Get.toNamed(RouteName.todoPage);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Supabase.instance.client.auth.onAuthStateChange,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        final session = snapshot.hasData ? snapshot.data!.session : null;

        return session == null ? const SignInPage() : const TodoScreen();
      },
    );
  }
}
