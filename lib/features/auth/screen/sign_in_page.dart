import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superbase_flutter_application/routes/route_name.dart';

import '../controller/login_controller.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: GetX<LoginController>(
          initState: (_) {},
          init: LoginController(),
          builder: (controller) => controller.isLoginLoading.value
              ? const SizedBox()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 60.0),
                    // Sign In title
                    Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 40.0),
                    // Email field (now uses global style)
                    TextField(
                      controller: controller.emailController,
                      decoration: InputDecoration(labelText: 'Email'),
                    ),
                    SizedBox(height: 20.0),
                    // Password field (now uses global style)
                    TextField(
                      controller: controller.passwordController,
                      obscureText: true,
                      decoration: InputDecoration(labelText: 'Password'),
                    ),
                    SizedBox(height: 20.0),
                    // Forgot Password link
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          // Handle forgot password action
                        },
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                    Spacer(), // Pushes the bottom elements to the bottom
                    // Sign Up and Submit button row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Sign Up link
                        TextButton(
                          onPressed: () => Get.toNamed(RouteName.signup),
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                                color: Colors.black, // Override global style for this button
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        // Circular arrow button (now uses global style)
                        ElevatedButton(
                          onPressed: () async {
                            String? isError = controller.validateSignIn();
                            if (isError == null) {
                              await controller.signInEmailAndPassword();
                              if (controller.isError == null) {
                                Get.offNamed(RouteName.todoPage);
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(isError)),
                              );
                            }
                          },
                          child: controller.isButtonLoading.value
                              ? SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  ),
                                )
                              : Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                ),
                        ),
                      ],
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
