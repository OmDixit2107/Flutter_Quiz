import 'package:flutter/material.dart';

class UiScreen extends StatelessWidget {
  const UiScreen(this.startQuiz, {super.key});
  final void Function() startQuiz;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        // C:\dev\fluuter projects\flutterquiz\assets\images\quiz-logo.png
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 400,
            height: 400,
            color: const Color.fromARGB(128, 255, 255, 255),
          ),
          const SizedBox(height: 40),
          const Center(
            child: Text(
              "Learn Flutter The Fun Way",
              style: TextStyle(color: Colors.white, fontSize: 28),
            ),
          ),
          const SizedBox(height: 40),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            label: const Text(
              "Start Quiz",
            ),
            icon: const Icon(Icons.arrow_right_alt),
          )
        ],
      ),
    );
  }
}
