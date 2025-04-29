import 'package:flutter/material.dart';
import 'package:flutter_superbase_learning/auth_service.dart';
import 'package:flutter_superbase_learning/sbAppButton.dart';
import 'package:flutter_superbase_learning/sbTextField.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SingupScreen extends StatefulWidget {
  const SingupScreen({super.key});

  @override
  State<SingupScreen> createState() => SingupScreenyWidgetState();
}

class SingupScreenyWidgetState extends State<SingupScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white),
      body: Column(
        children: <Widget>[
          const Text("SignUp", style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold)),
          const SizedBox(height: 60),
          SBTextField(
            controller: emailController,
            hint: "Enter email",
          ),
          const SizedBox(height: 20),
          SBTextField(
            controller: passwordController,
            hint: "Enter Password",
          ),
          const SizedBox(height: 20),
          Sbappbutton(
            buttonText: "Sing Up",
            onTap: () async {
              final AuthResponse res = await AuthService.signUpWithEmailPassword(
                email: "Example04@gmail.com",
                password: "Exam@04",
              );

              if (res.user != null) {
                print("User created successfully");
              }
            },
          )
        ],
      ),
    );
  }
}
