import 'package:flutter/material.dart';
import 'package:flutter_superbase_learning/api/auth_api.dart';
import 'package:flutter_superbase_learning/services/superbase_services.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


import '../../../di/local_storage_service.dart';
import '../../../di/locator.dart';

class LoginController extends GetxController {
  late AuthApi authApi;
  RxBool isLoginLoading = false.obs;
  RxBool isButtonLoading = false.obs;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final storage = locator<LocalStorageService>();
  String? isError;

  @override
  void onInit() {
    authApi = AuthApi(SuperbaseServices.client);
    super.onInit();
  }

  String? validateSignIn() {
    String? validateError;
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      validateError = 'Please enter both email and password';
    }
    return validateError;
  }

  Future<void> signInEmailAndPassword() async {
    try {
      isButtonLoading.value = true;
      final AuthResponse response = await authApi.login(email: emailController.text.trim(), password: passwordController.text.trim());
      print("TOKEN ${response.session?.accessToken}");
      print("USER ${response.user?.toJson()}");
      await storage.setString('token', response.session?.accessToken ?? '');
      await storage.setString('userName', response.user?.userMetadata?["userName"] ?? '');
      await storage.setString('email', response.user?.userMetadata?["email"] ?? '');

      isButtonLoading.value = false;
    } catch (e) {
      isError = e.toString();
      print('Error: $e');
    } finally {
      isButtonLoading.value = false;
    }
  }

  getCurrentUserEmail() {
    final session = authApi.supabaseClient.auth.currentSession;
    final user = session?.user;
    return user?.email;
  }
}
