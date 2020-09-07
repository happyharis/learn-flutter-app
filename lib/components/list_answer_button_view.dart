import 'package:flutter/material.dart';
import 'package:learn_flutter_app/components/answer_button.dart';
import 'package:learn_flutter_app/models/answer.dart';

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
            },
          ),
      ],
    );
  }
}
