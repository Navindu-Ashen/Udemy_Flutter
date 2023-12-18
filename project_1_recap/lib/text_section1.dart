import 'package:flutter/material.dart';

class TextSection1 extends StatelessWidget {
  const TextSection1(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 30,
        color: Color.fromARGB(255, 0, 0, 0),
      ),
    );
  }
}
