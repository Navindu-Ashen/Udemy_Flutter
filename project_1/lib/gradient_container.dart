import 'package:flutter/material.dart';
// import 'package:project_1/styled_Text.dart';
import 'package:project_1/styled_text2.dart';

const topAlignment = Alignment.topLeft;
const bottomAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key});

  @override
  Widget build(context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 0, 50, 120),
            Color.fromARGB(255, 0, 106, 255),
          ],
          begin: topAlignment,
          end: bottomAlignment,
        ),
      ),
      child: const Center(
        child: StyledText2("123"),
      ),
    );
  }
}
