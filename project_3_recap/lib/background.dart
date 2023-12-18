import 'package:flutter/material.dart';
import 'package:project_3_recap/overlay_screen.dart';

class Background extends StatefulWidget {
  const Background({super.key});

  @override
  State<Background> createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {
  void _openLoginOverlay() {
    showModalBottomSheet(
        context: context, builder: (ctx) => const OverlayScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Login trial"),
          actions: [
            IconButton(
              icon: const Icon(Icons.person), onPressed: _openLoginOverlay,
              iconSize: 40,
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 203, 181, 207),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 16),
                    textStyle: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold)),
                onPressed: _openLoginOverlay,
                child: const Text("Login"),
              ),
            ],
          ),
        ));
  }
}
