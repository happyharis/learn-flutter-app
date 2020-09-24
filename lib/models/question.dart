import 'package:learn_flutter_app/models/answer.dart';

class Question {
  final String text;
  final List<Answer> options;
  final bool isCompleted;
  final bool isCorrect;
  final int chosenAnswerId;
  Question(
    this.text, {
    this.options,
    this.isCompleted,
    this.isCorrect,
    this.chosenAnswerId,
  });

  Question copyWith({
    text,
    options,
    isCompleted,
    isCorrect,
    chosenAnswerId,
  }) {
    return Question(
      text ?? this.text,
      options: options ?? this.options,
      isCompleted: isCompleted ?? this.isCompleted,
      isCorrect: isCorrect ?? this.isCorrect,
      chosenAnswerId: chosenAnswerId ?? this.chosenAnswerId,
    );
  }
}

final question = Question(
  'If I were to move the middle circle widget to the top left, what are the alignment coordinates?',
  options: [
    Answer(id: 1, text: 'Alignment(1, 1)', isCorrect: true),
    Answer(id: 2, text: 'Alignment(1, 0)'),
    Answer(id: 3, text: 'Alignment(0, 1)'),
    Answer(id: 4, text: 'Alignment(0, 0)'),
  ],
);
