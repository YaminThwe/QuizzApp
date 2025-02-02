import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/data/quizz.dart';
import 'package:myapp/question_summary.dart';
import 'package:myapp/start_screen.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.selectedAnswers});

  final List<String> selectedAnswers;

  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> summary = [];

    for (int i = 0; i < selectedAnswers.length; i++) {
      bool isCorrect =
          selectedAnswers[i] == questions[i].answers[0]; // Check if correct
     
      summary.add({
        'question_index': i,
        'question': questions[i].question,
        'correct_answer': questions[i].answers[0], // First answer is correct
        'user_answer': selectedAnswers[i],
        'is_correct': isCorrect
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final correctCount =
        summaryData.where((data) => data['is_correct'] as bool).length;
    final totalQuestions = selectedAnswers.length;

    // Copy from questions_screen.dart
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.purple],
            ),
          ),
          child: SizedBox(
            child: Container(
              margin: const EdgeInsets.all(40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'You answered $correctCount out of $totalQuestions questions correctly',
                    style: GoogleFonts.lato(
                      color: const Color.fromARGB(255, 201, 153, 251),
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  // Text(
                  //   'You answered 2 out of 6 questions correctly',
                  //   style: GoogleFonts.lato(
                  //     color: const Color.fromARGB(255, 201, 153, 251),
                  //     fontSize: 20,
                  //   ),
                  //   textAlign: TextAlign.center,
                  // ),
                  QuestionSummary(summaryData: getSummaryData()),
                  const SizedBox(height: 30),
                  TextButton.icon(
                    icon: const Icon(
                      Icons.restart_alt,
                      color: Colors.white,
                      size: 15,
                    ),
                    label: const Text(
                      'Restart Quiz',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                            const StartScreen(),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
