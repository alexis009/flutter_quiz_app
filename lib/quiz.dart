import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/data/dummy_question.dart';
import 'package:flutter_quiz_app/start_screen.dart';
import 'package:flutter_quiz_app/question_screen.dart';
import 'package:flutter_quiz_app/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> _selectedAnswers = [];
  String activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
      _selectedAnswers = [];
    });
  }

  void chooseAnswer(String answer) {
    _selectedAnswers.add(answer);
    if (_selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == 'question-screen') {
      screenWidget = QuestionScreen(onSelectAnswer: chooseAnswer);
    }
    if (activeScreen == 'results-screen') {
      screenWidget = ResultScreen(
        chosenAnswers: _selectedAnswers,
        resetQuiz: switchScreen,
      );
    }
    if (activeScreen == 'start-screen') {
      screenWidget = StartScreen(switchScreen);
    }
    return MaterialApp(
      home: Scaffold(
          backgroundColor: const Color.fromARGB(255, 63, 143, 229),
          body: Container(
            child: screenWidget,
          )),
    );
  }
}
