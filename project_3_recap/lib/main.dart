import 'package:flutter/material.dart';
import 'package:project_3_recap/background.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
        useMaterial3: true,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 170, 58, 221),
            foregroundColor: Colors.white,
          ),
        ),
      ),
      home: const Background(),
    ),
  );
}
