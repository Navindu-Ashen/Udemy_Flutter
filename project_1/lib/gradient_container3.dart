import 'package:flutter/material.dart';
import 'package:project_1/dice_roller.dart';
// import 'package:project_1/styled_Text.dart';
// import 'package:project_1/styled_text2.dart';

const topAlignment = Alignment.topCenter;
const bottomAlignment = Alignment.bottomCenter;

// ignore: must_be_immutable
class GradientContainer extends StatelessWidget {
  const GradientContainer(this.color1, this.color2, {super.key});

  final Color color1;
  final Color color2;
  

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color1, color2],
          begin: topAlignment,
          end: bottomAlignment,
        ),
      ),
      child: const Center(
        child: DiceRoller(),
      ),
    );
  }
}
