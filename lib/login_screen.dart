import 'package:flutter/material.dart';
//import 'package:flutter_superbase_learning/AuthException.dart' as appAuth;
import 'package:flutter_superbase_learning/sbAppButton.dart';
import 'package:flutter_superbase_learning/sbTextField.dart';
import 'package:flutter_superbase_learning/singup_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emialController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late Supabase supabase;

  @override
  void initState() {
    supabase = Supabase.instance;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 120),
            const Text("Login", style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold)),
            const SizedBox(height: 60),
            SBTextField(
              controller: emialController,
              hint: "Enetr email",
            ),
            const SizedBox(height: 20),
            SBTextField(
              controller: passwordController,
              hint: "Enetr password",
            ),
            const SizedBox(height: 20),
            Sbappbutton(
              buttonText: "Login",
              onTap: () async {
                try {
                  // email: "Example04@gmail.com",
                  // password: "Exam@041",
                  final AuthResponse res = await AuthService.signInWithEmailPassword(
                    email: emialController.text.toString(),
                    password: passwordController.text.toString(),
                  );

                  if (res.user != null) {
                    print("User Login Successful");
                  }
                } catch (e) {
                  AuthException authException = e as AuthException;
                  print("*-*-*-* Error: ${authException.message}");
                  print("*-*-*-* Error: ${authException.statusCode}");
                  print("*-*-*-* Error: ${authException.code}");
                }
              },
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const SingupScreen();
                }));
              },
              child: const Text(
                "Don't have an account?",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
