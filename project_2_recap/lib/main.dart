import 'package:flutter/material.dart';
import 'package:project_2_recap/tabs.dart';
// import 'package:project_2_recap/test.dart';

final theme = ThemeData(
  useMaterial3: true,

);


void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: const TabsScreen(),
    );
  }
}