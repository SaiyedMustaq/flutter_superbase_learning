import 'package:flutter/material.dart';

class Sbappbutton extends StatelessWidget {
  const Sbappbutton({
    super.key,
    required this.buttonText,
    required this.onTap,
  });
  final String buttonText;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: const ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Colors.green)),
      onPressed: () {
        onTap();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 14),
        child: Text(
          buttonText,
          style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
