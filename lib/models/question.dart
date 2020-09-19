import 'package:learn_flutter_app/models/answer.dart';

class Question {
  final String text;
  final List<Answer> options;
  final bool isCompleted;
  final bool isCorrect;
  Question(
    this.text, {
    this.options,
    this.isCompleted,
    this.isCorrect,
  });

  Question copyWith({
    text,
    options,
    isCompleted,
    isCorrect,
  }) {
    return Question(
      text ?? this.text,
      options: options ?? this.options,
      isCompleted: isCompleted ?? this.isCompleted,
      isCorrect: isCorrect ?? this.isCorrect,
    );
  }
}

final question = Question(
  'If I were to move the middle circle widget to the top left, what are the alignment coordinates?',
  options: [
    Answer(text: 'Alignment(1, 1)', isCorrect: true),
    Answer(text: 'Alignment(1, 0)'),
    Answer(text: 'Alignment(0, 1)'),
    Answer(text: 'Alignment(0, 0)'),
  ],
);
