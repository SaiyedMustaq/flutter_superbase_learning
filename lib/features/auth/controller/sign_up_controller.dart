import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superbase_flutter_application/api/auth_api.dart';
import 'package:superbase_flutter_application/services/superbase_services.dart';

class SignUpController extends GetxController {
  late AuthApi authApi;
  RxBool isLoginLoading = false.obs;
  RxBool isSignUpLoading = false.obs;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void onInit() {
    authApi = AuthApi(SuperbaseServices.client);
    super.onInit();
  }

  void signInEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      isLoginLoading.value = true;
      isLoginLoading.value = false;
    } catch (e) {
      rethrow;
    } finally {
      isLoginLoading.value = false;
    }
  }

  Future<void> singUpWithEmailPasword() async {
    try {
      if (nameController.text.isEmpty ||
          emailController.text.isEmpty ||
          passwordController.text.isEmpty ||
          confirmPasswordController.text.isEmpty) {
        Get.snackbar('Error', 'Please fill in all fields',
            snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.white);
      } else if (passwordController.text != confirmPasswordController.text) {
        Get.snackbar('Error', 'Passwords do not match',
            snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.white);
      } else {
        isSignUpLoading.value = true;
        await authApi.signUp(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
            name: nameController.text.trim());
        isSignUpLoading.value = false;
      }
    } catch (e) {
      rethrow;
    } finally {
      isSignUpLoading.value = false;
    }
  }

  getCurrentUserEmail() {
    final session = authApi.supabaseClient.auth.currentSession;
    final user = session?.user;
    return user?.email;
  }
}
