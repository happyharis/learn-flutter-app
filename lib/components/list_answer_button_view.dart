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
    final questionNotifier = Provider.of<QuestionNotifier>(
      context,
      listen: false,
    );
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var answer in widget.answers)
          AnswerButton(
            answer: answer.text,
            isTapped: index == widget.answers.indexOf(answer),
            onPressed: () {
              final currentIndex = widget.answers.indexOf(answer);
              setState(() => index = currentIndex);
              questionNotifier.updateAnswer(answer.isCorrect);
            },
          ),
      ],
    );
  }
}
