import 'package:get/get.dart';
import 'package:superbase_flutter_application/api/auth_gate.dart';
import 'package:superbase_flutter_application/features/auth/screen/todo_screen.dart';
import 'package:superbase_flutter_application/routes/route_name.dart';

import '../features/auth/screen/sign_in_page.dart';
import '../features/auth/screen/sing_up_page.dart';

class Pages {
  static final pages = [
     GetPage(
      name: RouteName.authGate,
      page: () => const AuthGate(),
    ),
    GetPage(
      name: RouteName.signup,
      page: () => const SignUpPage(),
    ),
    GetPage(
      name: RouteName.signIn,
      page: () => const SignInPage(),
    ),
    GetPage(
      name: RouteName.todoPage,
      page: () => const TodoScreen(),
    ),
  ];
}
