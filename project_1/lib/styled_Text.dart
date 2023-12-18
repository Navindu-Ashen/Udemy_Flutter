import 'package:flutter/material.dart';

class StyledText extends StatefulWidget {
  const StyledText({super.key});


  @override
  State<StyledText> createState() => _StyledTextState();
}

class _StyledTextState extends State<StyledText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text(
        "Hello World",
        style:
            TextStyle(fontSize: 30, color: Color.fromARGB(255, 255, 255, 255)),
      ),
    );
  }
}
