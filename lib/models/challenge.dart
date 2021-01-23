import 'package:learn_flutter_app/models/choice.dart';

class Challenge {
  /// Found in the challenge card title (top)
  final String cardTitleText;

  /// Found in the challenge card description (bottom)
  final String cardDescription;
  final String cardImageUrl;

  /// Text inside question screen explaining the topic
  final String bodyText;

  /// Text inside question screen found above the options
  final String questionText;

  /// Image found above question text
  final String questionImageUrl;
  final List<Choice> options;

  /// Default null
  final bool isCompleted;
  final bool isCorrect;

  /// Represent id of tapped answer button
  final int chosenOptionId;

  /// Text in the ExplanationBottomSheet widget
  final String explanationText;

  Challenge({
    this.cardTitleText,
    this.cardDescription,
    this.cardImageUrl,
    this.bodyText,
    this.questionText,
    this.questionImageUrl,
    this.options,
    this.isCompleted,
    this.isCorrect,
    this.chosenOptionId,
    this.explanationText,
  });

  Challenge copyWith({
    String cardTitleText,
    String cardDescription,
    String cardImageUrl,
    String bodyText,
    String questionText,
    String questionImageUrl,
    List<Choice> options,
    bool isCompleted,
    bool isCorrect,
    int chosenOptionId,
    String explanationText,
  }) {
    return Challenge(
      cardTitleText: cardTitleText ?? this.cardTitleText,
      cardDescription: cardDescription ?? this.cardDescription,
      cardImageUrl: cardImageUrl ?? this.cardImageUrl,
      bodyText: bodyText ?? this.bodyText,
      questionText: questionText ?? this.questionText,
      questionImageUrl: questionImageUrl ?? this.questionImageUrl,
      options: options ?? this.options,
      isCompleted: isCompleted ?? this.isCompleted,
      isCorrect: isCorrect ?? this.isCorrect,
      chosenOptionId: chosenOptionId ?? this.chosenOptionId,
      explanationText: explanationText ?? this.explanationText,
    );
  }
}

final alignmentChallenge = [
  Challenge(
    cardTitleText: 'Alignment',
    cardDescription:
        'Alignments are great at positioning child widgets. Do you know how to position them outside the widget?',
    bodyText:
        'Alignment(0.0, 0.0) represents the center of the rectangle.\n\nThe distance from -1.0 to +1.0 is the distance from one side of the rectangle to the other side of the rectangle.\n\nTherefore, 2.0 units horizontally (or vertically) is equivalent to the width (or height) of the rectangle.\n\nAlignment(-1.0, -1.0) represents the top left of the rectangle.\n\nAlignment(1.0, 1.0) represents the bottom right of the rectangle.',
    questionText:
        'If I were to move the middle circle widget to the top left, what are the alignment coordinates?',
    options: [
      Choice(id: 1, text: 'Alignment(1, 1)', isAnswer: true),
      Choice(id: 2, text: 'Alignment(1, 0)'),
      Choice(id: 3, text: 'Alignment(0, 1)'),
      Choice(id: 4, text: 'Alignment(0, 0)'),
    ],
    explanationText:
        'Top left coordinates are the start alignment 1, 1. Top left coordinates are the start alignment 1, 1.Top left coordinates are the start alignment 1, 1.',
    cardImageUrl: 'https://i.ibb.co/Jqn5Ydx/1.jpg',
    questionImageUrl: 'https://i.ibb.co/t21vmk8/2.jpg',
  ),
];
