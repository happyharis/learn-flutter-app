import 'package:flutter/material.dart';

class QuestionNotifier extends ChangeNotifier {
  bool _isAnswerCorrect;

  get isAnswerCorrect => _isAnswerCorrect;

  void updateAnswer(bool isCorrect) {
    _isAnswerCorrect = isCorrect;
  }
}
