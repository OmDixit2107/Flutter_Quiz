import 'package:flutter/material.dart';
import 'package:flutterquiz/QuestionsScreen.dart';
import 'package:flutterquiz/data/questions.dart';
import 'package:flutterquiz/resultscreen.dart';
import 'package:flutterquiz/screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var screen = "start_screen";

  void switchScreen() {
    setState(() {
      screen = "questions_screen";
    });
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      screen = "questions_screen";
    });
  }

  void chooseAns(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(
        () {
          screen = "result_screen";
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = UiScreen(switchScreen);
    if (screen == "questions_screen") {
      screenWidget = QuestionsScreen(chooseAns);
    }
    if (screen == "result_screen") {
      screenWidget = Resultscreen(selectedAnswers, restartQuiz);
    }
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 69, 14, 79),
        body: screenWidget,
      ),
    );
  }
}
