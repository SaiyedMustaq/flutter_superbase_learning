import 'package:flutter/material.dart';
import 'package:flutter_superbase_learning/di/locator.dart';
import 'package:flutter_superbase_learning/my_app.dart';
import 'package:flutter_superbase_learning/services/superbase_services.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync<SuperbaseServices>(
    () async => SuperbaseServices(),
  );
  await setupLocator();
  runApp(const MyApp());
}
