import 'package:flutter/material.dart';
import 'dart:math';

final randomizor1 = Random();
final randomizor2 = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  var activeDiceImage1 = 'assets/images/dice-1.png';
  var activeDiceImage2 = 'assets/images/dice-1.png';

  void rollDice() {
    setState(
      () {
        var diceImage1 = randomizor1.nextInt(6) + 1;
        var diceImage2 = randomizor2.nextInt(6) + 1;

        activeDiceImage1 = 'assets/images/dice-$diceImage1.png';
        activeDiceImage2 = 'assets/images/dice-$diceImage2.png';

        print("Rolling");
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
        Image.asset(
          activeDiceImage2,
          width: 200,
        ),
        const SizedBox(
          height: 20,
        ),
        TextButton(
          onPressed: rollDice,
          child: const Text(
            'Roll Dice',
            style: TextStyle(
              fontSize: 30,
              color: Color.fromARGB(255, 0, 0, 0),
              // fontWeight: FontWeight.bold,
              // backgroundColor: Color.fromARGB(255, 10, 9, 6),
            ),
          ),
        )
      ],
    );
  }
}
