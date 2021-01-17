import 'package:learn_flutter_app/models/choice.dart';

class Challenge {
  final String questionText;
  final List<Choice> options;

  /// Default null
  final bool isCompleted;
  final bool isCorrect;

  /// Represent id of tapped answer button
  final int chosenAnswerId;
  Challenge(
    this.questionText, {
    this.options,
    this.isCompleted,
    this.isCorrect,
    this.chosenAnswerId,
  });

  Challenge copyWith({
    text,
    options,
    isCompleted,
    isCorrect,
    chosenAnswerId,
  }) {
    return Challenge(
      text ?? this.questionText,
      options: options ?? this.options,
      isCompleted: isCompleted ?? this.isCompleted,
      isCorrect: isCorrect ?? this.isCorrect,
      chosenAnswerId: chosenAnswerId ?? this.chosenAnswerId,
    );
  }
}

final question = Challenge(
  'If I were to move the middle circle widget to the top left, what are the alignment coordinates?',
  options: [
    Choice(id: 1, text: 'Alignment(1, 1)', isAnswer: true),
    Choice(id: 2, text: 'Alignment(1, 0)'),
    Choice(id: 3, text: 'Alignment(0, 1)'),
    Choice(id: 4, text: 'Alignment(0, 0)'),
  ],
);
