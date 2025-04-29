import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:superbase_flutter_application/routes/route_name.dart';

import 'routes/pages.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Superbase Application',
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          primary: const Color.fromARGB(255, 0, 0, 0),
          secondary: const Color.fromARGB(255, 17, 117, 224),
        ),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(color: Colors.grey),
          filled: true,
          fillColor: Colors.grey[100],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(color: Colors.black54),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black, // Button background color
            foregroundColor: Colors.white, // Button text/icon color
            shape: CircleBorder(), // Circular shape for the button
            padding: EdgeInsets.all(16.0), // Padding for the button
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.grey, // Default color for TextButtons
          ),
        ),
        useMaterial3: true,
        fontFamily: 'Poppins',
      ),
      initialRoute: RouteName.signIn,
      getPages: Pages.pages,
    );
  }
}
