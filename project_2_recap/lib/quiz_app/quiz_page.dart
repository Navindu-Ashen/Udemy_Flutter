import 'package:flutter/material.dart';
import 'package:project_2_recap/quiz_app/answer_button.dart';
import 'package:project_2_recap/quiz_app/quiz_questions.dart';

class QuizPage extends StatefulWidget {
  const QuizPage(this.goBack, this.resultScreen, this.onSelectedAnswer,
      {super.key});

  final void Function() goBack;
  final void Function() resultScreen;
  final void Function(String selectedAnswerPass) onSelectedAnswer;

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  var questionNumber = 0;

  void goBack() {
    widget.goBack();
  }

  void results() {
    widget.resultScreen();
  }

  void nextQuestionAndSelectedAnswer(String selectedAnswer) {
    widget.onSelectedAnswer(selectedAnswer);

    if (questionNumber + 1 < questions.length) {
      setState(() {
        questionNumber++;
      });
    } else {
      questionNumber = 0;
      results();
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[questionNumber];
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(
            height: 180,
          ),
          Container(
            margin: const EdgeInsets.only(left: 16, right: 16),
            child: Text(
              currentQuestion.text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ...currentQuestion.getShuffledAnswers().map(
            (answer) {
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                child: AnswerButton(
                  answer,
                  () {
                    nextQuestionAndSelectedAnswer(answer);
                  },
                ),
              );
            },
          ),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 127, 91, 233),
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              textStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: goBack,
            child: const Text("Menu"),
          ),
        ],
      ),
    );
  }
}
