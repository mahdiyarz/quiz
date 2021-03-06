import 'package:flutter/material.dart';
import '../model/question.dart';

class QuizApp extends StatefulWidget {
  QuizApp({Key? key}) : super(key: key);

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  List questionBank = [
    Question('This questionText1 is TRUE and you answer true or false', true),
    Question('This questionText2 is FALSE and you answer true or false', false),
    Question('This questionText3 is FALSE and you answer true or false', false),
  ];
  int nextQuestion = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Real Citizen"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Container(
        color: Colors.blueGrey.shade400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                "images/flag.png",
                width: 300,
                height: 200,
              ),
            ),
            Container(
              width: 350,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  color: Colors.white,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(15),
              child: Text(
                questionBank[nextQuestion].questionText,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16.9,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _checkAnswer(true, context),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.blueGrey.shade700),
                  ),
                  child: const Text(
                    "True",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => _checkAnswer(false, context),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.blueGrey.shade700),
                  ),
                  child: const Text(
                    "False",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  onPressed: _nextQuestion,
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.blueGrey.shade700),
                  ),
                  child: nextQuestion < questionBank.length - 1
                      ? const Icon(Icons.arrow_forward_ios_rounded)
                      : const Icon(Icons.restart_alt),
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  _checkAnswer(bool checkResult, BuildContext context) {
    if (checkResult == questionBank[nextQuestion].isCorrect) {
      var snackBar = const SnackBar(
        duration: Duration(milliseconds: 500),
        backgroundColor: Colors.green,
        content: Text("Correct"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      setState(() {
        if (nextQuestion < questionBank.length - 1) {
          nextQuestion++;
        } else {}
      });

      debugPrint("is correct");
    } else {
      var snackBar = const SnackBar(
        duration: Duration(milliseconds: 500),
        backgroundColor: Colors.redAccent,
        content: Text("Incorrect"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      debugPrint("incorrect");
    }
  }

  void _nextQuestion() {
    setState(() {
      if (nextQuestion < questionBank.length - 1) {
        nextQuestion++;
      } else {
        nextQuestion = 0;
      }
    });
  }
}
