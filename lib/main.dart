import 'package:flutter/material.dart';
import 'package:questions/start_screen.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 64, 36, 113), 
                Color.fromARGB(255, 45, 15, 97),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,

            ),
          ),
          child: const StartScreen(),
        ),
      ),
    ),
  );
}
