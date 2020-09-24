import 'package:flutter/material.dart';
import 'package:learn_flutter_app/components/answer_button.dart';
import 'package:learn_flutter_app/models/answer.dart';
import 'package:learn_flutter_app/models/question_notifier.dart';
import 'package:provider/provider.dart';

class ListAnswerButtonView extends StatefulWidget {
  final List<Answer> answers;
  const ListAnswerButtonView({
    Key key,
    @required this.answers,
  }) : super(key: key);

  @override
  _ListAnswerButtonViewState createState() => _ListAnswerButtonViewState();
}

class _ListAnswerButtonViewState extends State<ListAnswerButtonView> {
  int index;
  @override
  Widget build(BuildContext context) {
    final updateAnswer = Provider.of<QuestionNotifier>(
      context,
      listen: false,
    ).updateAnswer;
    final updateChosenAnswer = Provider.of<QuestionNotifier>(
      context,
      listen: false,
    ).updateChosenAnswer;
    final _question = Provider.of<QuestionNotifier>(context).currentQuestion;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var answer in widget.answers)
          AnswerButton(
            answer: answer,
            question: _question,
            isTapped: index == widget.answers.indexOf(answer),
            onPressed: () {
              final currentIndex = widget.answers.indexOf(answer);
              setState(() => index = currentIndex);
              updateChosenAnswer(answer.id);
              updateAnswer(answer.isCorrect);
            },
          ),
      ],
    );
  }
}
