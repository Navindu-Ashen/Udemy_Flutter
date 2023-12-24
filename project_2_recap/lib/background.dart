import 'package:flutter/material.dart';
import 'package:project_2_recap/care_me/login_screen.dart';
import 'package:project_2_recap/count_app/count_page.dart';
import 'package:project_2_recap/home_page.dart';
import 'package:project_2_recap/quiz_app/quiz_page.dart';
import 'package:project_2_recap/quiz_app/results_screen.dart';
import 'package:project_2_recap/care_me/welcome_page.dart';

class Background extends StatefulWidget {
  const Background({super.key});

  @override
  State<Background> createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {
  var activeScreen = "home-screen";

  List<String> selectedAnswers = [];

  void switchScreen() {
    setState(() {
      activeScreen = "count-screen";
    });
  }

  void switchScreenQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = "quiz-screen";
    });
  }

  void switchScreenCareMe() {
    setState(() {
      activeScreen = "careme-screen";
    });
  }

  void switchScreenBack() {
    setState(() {
      selectedAnswers = [];
      activeScreen = "home-screen";
    });
  }

  void switchScreenResults() {
    setState(() {
      activeScreen = "results-screen";
    });
  }

  void switchScreenLogin() {
    setState(() {
      activeScreen = "login-screen";
    });
  }

  void choosedAnswers(String answer) {
    selectedAnswers.add(answer);
    print(selectedAnswers);
  }

  @override
  Widget build(BuildContext context) {
    Widget currentScreen =
        HomePage(switchScreen, switchScreenQuiz, switchScreenCareMe);

    if (activeScreen == "count-screen") {
      currentScreen = CountPage();
      // currentScreen = const WelcomePage();
    } else if (activeScreen == "quiz-screen") {
      currentScreen = QuizPage(
        switchScreenBack,
        switchScreenResults,
        choosedAnswers,
      );
    } else if (activeScreen == "careme-screen") {
      currentScreen = WelcomePage(
        onLoginScreen: switchScreenLogin,
      );
    } else if (activeScreen == "results-screen") {
      currentScreen =
          ResultPage(switchScreenBack, switchScreenQuiz, selectedAnswers);
    } else if (activeScreen == "login-screen") {
      currentScreen = const LoginScreen();
    }
    return Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 133, 0, 169),
                Color.fromARGB(255, 88, 52, 195),
                // Color.fromARGB(255, 255, 255, 255),
                // Color.fromARGB(255, 255, 255, 255),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: currentScreen,

    );
  }
}
