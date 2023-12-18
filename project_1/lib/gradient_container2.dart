import 'package:flutter/material.dart';
// import 'package:project_1/styled_Text.dart';
import 'package:project_1/styled_text2.dart';

const topAlignment = Alignment.topLeft;
const bottomAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key, required this.colors});

  final List<Color> colors;

  @override
  Widget build(context) {
    return Container(
      decoration:  BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
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
