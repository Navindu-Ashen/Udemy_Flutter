import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(this.answerText, this.nextQuestion, {super.key});

  final String answerText;
  final void Function() nextQuestion;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
          backgroundColor: const Color.fromARGB(255, 101, 69, 196),
          foregroundColor: Colors.white,
          minimumSize: const Size.fromHeight(5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          )),
      onPressed: nextQuestion,
      child: Text(
        answerText,
        textAlign: TextAlign.center,
      ),
    );
  }
}
