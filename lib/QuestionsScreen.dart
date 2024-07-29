import 'package:flutter/material.dart';
import 'package:flutterquiz/answer_button.dart';
import 'package:flutterquiz/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(this.onSelectAnswer, {super.key});

  final void Function(String answer) onSelectAnswer;

  @override
  State<StatefulWidget> createState() {
    return _QuestionsScreen();
  }
}

class _QuestionsScreen extends State<QuestionsScreen> {
  var qsnindex = 0;
  void answerqsn(String selectedans) {
    widget.onSelectAnswer(selectedans);
    setState(
      () {
        qsnindex++;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[qsnindex];
    return Container(
      margin: EdgeInsets.all(20),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestion.getshuffledanswers().map((answer) {
              return AnswerButton(answer, () {
                answerqsn(answer);
              });
            })
          ],
        ),
      ),
    );
  }
}
