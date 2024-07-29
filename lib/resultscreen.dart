import 'package:flutter/material.dart';
import 'package:flutterquiz/data/questions.dart';
import 'package:flutterquiz/questions_summary.dart';

class Resultscreen extends StatelessWidget {
  const Resultscreen(this.chosenans, this.restartquiz, {super.key});
  final List<String> chosenans;
  final void Function() restartquiz;
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenans.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'chosen_answer': chosenans[i],
        },
      );
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numtotalqsn = questions.length;
    final summarydata = getSummaryData();
    final numcorrectqsns = summarydata.where((data) {
      return data['chosen_answer'] == data['correct_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                "U answered $numcorrectqsns out of $numtotalqsn qsns correctly!",
                style: const TextStyle(color: Colors.white)),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summarydata),
            OutlinedButton.icon(
              onPressed: restartquiz,
              label: const Text(
                "Restart Quiz",
              ),
              icon: const Icon(Icons.restart_alt),
            )
          ],
        ),
      ),
    );
  }
}
