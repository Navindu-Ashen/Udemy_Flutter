import 'package:flutter/material.dart';
// import 'package:project_1/gradient_container.dart';
// import 'package:project_1/gradient_container2.dart';
import 'package:project_1/gradient_container3.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        // backgroundColor: Color.fromARGB(255, 245, 135, 143),
        // body: GradientContainer(colors: [Color.fromARGB(255, 214, 197, 10), Color.fromARGB(255, 255, 255, 255)],),
        body: GradientContainer(
          Color.fromARGB(255, 46, 65, 174),
          Color.fromARGB(255, 110, 110, 255),
        ),
      ),
    ),
  );
}
