import 'package:flutter/material.dart';
import 'package:myapp/result_screen.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.purple],
            ),
          ),
          child: const ResultScreen(),
        ),
      ),
    )
  );
}
