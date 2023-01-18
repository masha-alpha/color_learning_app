import 'package:flutter/material.dart';
import 'color_screen.dart';
import 'quiz_screen.dart';

final routes = {
  '/': (BuildContext context) => const ColorsScreen(),
  '/quiz': (BuildContext context) => const QuizScreen(),
};
