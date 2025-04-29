import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superbase_flutter_application/di/locator.dart';
import 'package:superbase_flutter_application/my_app.dart';
import 'package:superbase_flutter_application/services/superbase_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync<SuperbaseServices>(
    () async => SuperbaseServices(),
  );
  await setupLocator();
  runApp(const MyApp());
}
