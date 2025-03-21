import 'package:questions/data/questions.dart';
import 'package:questions/ui/questions_screen.dart';
import 'package:questions/ui/results_screen.dart';
import 'package:questions/ui/start_screen.dart';
import 'package:flutter/material.dart';

enum Screen { start, questions, results }

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() =>  _QuizState();
}

class _QuizState extends State<Quiz> {
  final List<String> _selectedAnswers = [];

  var _activeScreen = Screen.start;

  void _switchScreen() {
    setState(() {
      _activeScreen = Screen.questions;
    });
  }

  void _chooseAnswer(String answer) {
    _selectedAnswers.add(answer);

    if (_selectedAnswers.length == questions.length) {
      setState(() {
        _activeScreen = Screen.results;
      });
    }
  }

  void restartQuiz() {
    setState(() {
      _activeScreen = Screen.questions;
      _selectedAnswers.clear();
    });
  }

  @override
  Widget build(context) {

    // Define the widget for the current screen.
    Widget screenWidget = StartScreen(_switchScreen);

    switch (_activeScreen) {
      case Screen.questions:
        screenWidget = QuestionsScreen(onSelectAnswer: _chooseAnswer);
        break;
      case Screen.results:
        screenWidget = ResultsScreen(
          chosenAnswers: _selectedAnswers,
          onRestart: restartQuiz,
        );
        break;
      case Screen.start:
        screenWidget = StartScreen(_switchScreen);
        break;
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 33, 5, 109),
                Color.fromARGB(255, 68, 21, 149),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
