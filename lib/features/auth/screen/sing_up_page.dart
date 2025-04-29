// Sign Up Page
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:superbase_flutter_application/features/auth/controller/sign_up_controller.dart';
import 'package:superbase_flutter_application/features/auth/screen/sign_in_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return GetX(
      initState: (_) {},
      init: SignUpController(),
      builder: (controller) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 40.0),
                  // Title
                  Text(
                    'Superbase',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  // Subtitle
                  Text(
                    'Welcome to the world of AI chats prompts',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(height: 40.0),
                  // Name field
                  TextField(
                    controller: controller.nameController,
                    decoration: InputDecoration(
                      labelText: 'Name',
                    ),
                  ),
                  SizedBox(height: 20.0),
                  // Email field
                  TextField(
                    controller: controller.emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                  ),
                  SizedBox(height: 20.0),
                  // Password field
                  TextFormField(
                    controller: controller.passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),
                  ),
                  SizedBox(height: 20.0),
                  // Confirm Password field
                  TextField(
                    controller: controller.confirmPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                    ),
                  ),
                  SizedBox(height: 32.0),
                  // Sign up button
                  FilledButton(
                      onPressed: controller.singUpWithEmailPasword,
                      child: Text(
                        controller.isSignUpLoading.value ? "Please wait..." : "Sing Up",
                      )),
                  SizedBox(height: 16.0),
                  // Divider with "OR"
                  Row(
                    children: [
                      Expanded(child: Divider(color: Colors.black54)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          '— OR —',
                          style: TextStyle(color: Colors.black54),
                        ),
                      ),
                      Expanded(child: Divider(color: Colors.black54)),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  // Login link
                  Center(
                    child: TextButton(
                      onPressed: () => Get.off(() => SignInPage()),
                      child: RichText(
                        text: TextSpan(
                          text: 'Already have an account? ',
                          style: TextStyle(color: Colors.black54),
                          children: [
                            TextSpan(
                              text: 'Login',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
