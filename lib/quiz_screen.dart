import 'package:flutter/material.dart';
import 'package:color_app/result_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> with TickerProviderStateMixin {
  int _currentQuestion = 0;
  int _score = 0;
  String _selectedOption = '';
  final _questions = [
    {
      'question': 'What color is the sky?',
      'options': ['Red', 'Green', 'Blue'],
      'answer': 'Blue',
    },
    {
      'question': 'What color are apples?',
      'options': ['Red', 'Green', 'Blue'],
      'answer': 'Green',
    },
  ];
  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller!);
    super.initState();
  }

  void _checkAnswer(String answer) {
    if (answer == _questions[_currentQuestion]['answer']) {
      _score++;
    }
    setState(() {
      _currentQuestion++;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_currentQuestion >= _questions.length) {
      return ResultScreen(score: _score);
    }
    return WillPopScope(
      onWillPop: () async {
        return await showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: const Text('Are you sure?'),
                      content: const Text('Do you want to exit the quiz?'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          child: const Text('No'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(true),
                          child: const Text('Yes'),
                        ),
                      ],
                    )) ??
            false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Quiz'),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Text(_questions[_currentQuestion]['question'] as String),
              Expanded(
                child: ListView(
                  children:
                      (_questions[_currentQuestion]['options'] as List<String>)
                          .map((option) => RadioListTile(
                                title: Text(option),
                                value: option,
                                groupValue: _selectedOption,
                                onChanged: (value) {
                                  setState(() {
                                    _selectedOption = value!;
                                  });
                                },
                              ))
                          .toList(),
                ),
              ),
              ElevatedButton(
                child: const Text('Submit'),
                onPressed: () {
                  _checkAnswer(_selectedOption);
                },
              ),
              FadeTransition(
                opacity: _animation!,
                child: ElevatedButton(
                  child: const Text('Submit'),
                  onPressed: () {
                    _checkAnswer(_selectedOption);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
