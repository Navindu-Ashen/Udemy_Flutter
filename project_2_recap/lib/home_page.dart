import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage(this.startAppCount, this.startAppQuiz, this.startAppCareMe,
      {super.key});

  final void Function() startAppCount;
  final void Function() startAppQuiz;
  final void Function() startAppCareMe;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        // margin: const EdgeInsets.only(top: 50),
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(
            height: 40,
          ),
          Text(
            "Welcome..!",
            style: GoogleFonts.kanit(
              fontWeight: FontWeight.normal,
              fontSize: 40,
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 250,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(155, 123, 25, 150),
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                )),
            onPressed: startAppCount,
            child: const Text(
              "Count App",
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(155, 123, 25, 150),
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                )),
            onPressed: startAppQuiz,
            child: const Text(
              "Quiz App",
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(155, 123, 25, 150),
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                )),
            onPressed: startAppCareMe,
            child: const Text(
              "CareMe App Screen",
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
