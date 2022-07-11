import 'package:flutter/material.dart';

import './quiz.dart';
import './results.dart';

/* void main() {
  runApp(MyApp());
} */
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'scoreText': 'Red', 'score': 5},
        {'scoretext': 'Blue', 'score': 3},
        {'scoreText': 'Green', 'score': 1},
        {'scoreText': 'Black', 'score': 10}
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'scoreText': 'Rabbit', 'score': 3},
        {'scoreText': 'Lion', 'score': 5},
        {'scoreText': 'Snake', 'score': 10},
        {'scoreText': 'Dog', 'score': 1}
      ],
    },
    {
      'questionText': 'Who\'s your favorite player',
      'answers': [
        {'scoreText': 'Messi', 'score': 3},
        {'scoreText': 'Ronaldo', 'score': 10},
        {'scoreText': 'Lewandowski', 'score': 5},
        {'scoreText': 'Shevchenko', 'score': 1}
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      var _questionIndex = 0;
      var _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    }
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext ctx) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('My FirstApp')),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
