import 'package:flutter/material.dart';

class StyledText2 extends StatelessWidget {
  const StyledText2(this.text, {super.key});

  final String text;

  @override
  Widget build(context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 30,
        color: Color.fromARGB(255, 255, 255, 255),
      ),
    );
  }
}
