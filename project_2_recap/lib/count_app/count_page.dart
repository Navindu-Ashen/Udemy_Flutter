import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CountPage extends StatefulWidget {
  const CountPage({super.key});


  @override
  State<CountPage> createState() => _CountPageState();
}

class _CountPageState extends State<CountPage> {
  var buttonCount = 0;
  // ignore: non_constant_identifier_names
  void ButtonClick() {
    setState(() {
      buttonCount++;
    });
  }

  void buttonClickDecriment() {
    setState(() {
      buttonCount--;
    });
  }

  // void backButtonClick() {
  //   widget.goBack();
  // }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 150),
            padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 50),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              color: Color.fromARGB(255, 111, 79, 207),
            ),
            child: Text(
              "Count: $buttonCount",
              style: GoogleFonts.lato(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 200,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 127, 91, 233),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
            ),
            onPressed: ButtonClick,
            child: const Text(
              "Increment",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 127, 91, 233),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
            ),
            onPressed: buttonClickDecriment,
            child: const Text(
              "Decrement",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          
        ],
      ),
    );
  }
}
