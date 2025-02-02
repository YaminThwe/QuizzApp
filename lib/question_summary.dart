import 'package:flutter/material.dart';

// Class name and constructor must be the same
class QuestionSummary extends StatelessWidget {
  const QuestionSummary({super.key, required this.summaryData}); // Constructor

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...summaryData.map((data) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start, // Align items to top
                    children: [
                      // Circular number indicator
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade300,
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          '${(data['question_index'] as int) + 1}', // Increment question index
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),

                      // Question and Answers
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${data['question']}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'Selected Answer: ${data['user_answer']}',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Color.fromARGB(255, 203, 151, 168),
                              ),
                            ),
                            Text(
                              'Correct Answer: ${data['correct_answer']}',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
      ),
    );
  }
}
