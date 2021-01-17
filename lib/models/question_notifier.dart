import 'package:flutter/material.dart';
import 'package:learn_flutter_app/models/challenge.dart';

class QuestionNotifier extends ChangeNotifier {
  Challenge _currentQuestion;

  Challenge get currentQuestion => _currentQuestion;

  void updateAnswer(bool isCorrect) {
    _currentQuestion = _currentQuestion.copyWith(isCorrect: isCorrect ?? false);
    notifyListeners();
  }

  void updateCompletion(bool isCompleted) {
    _currentQuestion = _currentQuestion.copyWith(
      isCompleted: isCompleted ?? false,
    );
    notifyListeners();
  }

  void updateChosenAnswer(int answerId) {
    _currentQuestion = _currentQuestion.copyWith(
      chosenAnswerId: answerId,
    );
    notifyListeners();
  }

  void initialise(Challenge question) {
    _currentQuestion = question;
  }
}
