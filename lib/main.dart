import 'package:questions/ui/quiz.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: true,
      home: Scaffold(
        body: Quiz(),
        ),
      ),
  );
}