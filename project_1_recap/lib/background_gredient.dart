import 'package:flutter/material.dart';
import 'package:project_1_recap/dice_roller.dart';
// import 'package:project_1_recap/text_section1.dart';

class BackgroundGredient extends StatelessWidget {
  const BackgroundGredient({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 255, 94, 0),
            Color.fromARGB(255, 251, 202, 63),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: const Center(
            child: DiceRoller(),
      ),
    );
  }
}
