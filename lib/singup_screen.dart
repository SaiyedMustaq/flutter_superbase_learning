import 'package:flutter/material.dart';
import 'package:flutter_superbase_learning/sbAppButton.dart';
import 'package:flutter_superbase_learning/sbTextField.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SingupScreen extends StatefulWidget {
  const SingupScreen({super.key});

  @override
  State<SingupScreen> createState() => SingupScreenyWidgetState();
}

class SingupScreenyWidgetState extends State<SingupScreen> {
  final TextEditingController emialController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final supabaseauth = Supabase.instance.client.auth;
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
          const Text("SignUp",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 60),
          SBTextField(
            controller: emialController,
            hint: "Enetr email",
          ),
          const SizedBox(height: 20),
          SBTextField(
            controller: passwordController,
            hint: "Enetr surname",
          ),
          const SizedBox(height: 20),
          Sbappbutton(
            buttonText: "Singup",
            onTap: () async {
              final reesult = await supabaseauth.signUp(
                  email: emialController.text,
                  password: passwordController.text,
                  data: {
                    "email": emialController.text,
                    "name": passwordController.text
                  });

              if (reesult.user != null) {
                print("User created sucessfully");
              }
              // await supabase.client.from("user").insert({
              //   "email": emialController.text,
              //   "surname": passwordController.text
              // });

              // AuthResponse response = await supabase.client.auth.signUp(
              //   email: emialController.text,
              //   password: passwordController.text,
              // );
              // if (response.user != null) {
              //   print("User created sucessfully");
              // }
            },
          )
        ],
      ),
    );
  }
}
