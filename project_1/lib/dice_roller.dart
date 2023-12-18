import 'package:flutter/material.dart';
import 'dart:math';

final randomizor1 = Random();
final randomizor2 = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  var activeDiceImage1 = 'assets/images/dice-1.png';
  var activeDiceImage2 = 'assets/images/dice-1.png';

  void rollDice() {
    setState(
      () {
        var diceNumber1 = randomizor1.nextInt(6) + 1;
        var diceNumber2 = randomizor2.nextInt(6) + 1;
        activeDiceImage1 = 'assets/images/dice-$diceNumber1.png';
        activeDiceImage2 = 'assets/images/dice-$diceNumber2.png';
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          activeDiceImage1,
          width: 200,
        ),
        const SizedBox(
          height: 20,
        ),
        Image.asset(
          activeDiceImage2,
          width: 200,
        ),
        const SizedBox(
          height: 20,
        ),
        TextButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(
            // padding: const EdgeInsets.only(top: 20),
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 28),
            // backgroundColor: const Color.fromARGB(150, 102, 102, 102),
          ),
          child: const Text(
            "Roll Dice",
          ),
        ),
      ],
    );
  }
}
