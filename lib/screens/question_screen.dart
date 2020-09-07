import 'package:flutter/material.dart';
import 'package:learn_flutter_app/components/list_answer_button_view.dart';
import 'package:learn_flutter_app/constants/colors.dart';
import 'package:learn_flutter_app/models/answer.dart';
import 'package:learn_flutter_app/models/question_notifier.dart';
import 'package:learn_flutter_app/screens/challenge_screen.dart';
import 'package:provider/provider.dart';

class QuestionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<QuestionNotifier>(
      create: (context) => QuestionNotifier(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ZukunfColor.blue.withOpacity(1),
          title: Text('Challenge'),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 187,
                color: ZukunfColor.blue,
                child: Stack(
                  children: [
                    CardTitle('Alignment'),
                    CardImage(),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 35.0, vertical: 38),
                child: Text(
                    'Alignment(0.0, 0.0) represents the center of the rectangle.\n\nThe distance from -1.0 to +1.0 is the distance from one side of the rectangle to the other side of the rectangle.\n\nTherefore, 2.0 units horizontally (or vertically) is equivalent to the width (or height) of the rectangle.\n\nAlignment(-1.0, -1.0) represents the top left of the rectangle.\n\nAlignment(1.0, 1.0) represents the bottom right of the rectangle.'),
              ),
              Container(
                height: 187,
                color: ZukunfColor.blue,
                child: Stack(
                  children: [
                    CardImage(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 38),
                      child: Text(
                          'If I were to move the middle circle widget to the top left, what are the alignment coordinates?'),
                    ),
                    ListAnswerButtonView(
                      answers: [
                        Answer(text: 'Alignment(1, 1)', isCorrect: true),
                        Answer(text: 'Alignment(1, 0)'),
                        Answer(text: 'Alignment(0, 1)'),
                        Answer(text: 'Alignment(0, 0)'),
                      ],
                    ),
                    SizedBox(height: 15),
                    Builder(
                      builder: (context) {
                        final questionNotifier =
                            Provider.of<QuestionNotifier>(context);
                        return ZukunfButton.solid(
                          text: 'Submit',
                          onPressed: () {
                            print(questionNotifier.isAnswerCorrect);
                          },
                        );
                      },
                    ),
                    SizedBox(height: 20),
                    ZukunfButton(
                      text: 'Show Explanation',
                      onPressed: () {},
                    ),
                    SizedBox(height: 32),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ZukunfButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final bool isSolid;
  const ZukunfButton({
    Key key,
    @required this.text,
    @required this.onPressed,
    this.isSolid = false,
  }) : super(key: key);
  const ZukunfButton.solid({
    Key key,
    @required this.text,
    @required this.onPressed,
    this.isSolid = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            color: isSolid ? Colors.white : ZukunfColor.grey,
          ),
        ),
      ),
      minWidth: double.infinity,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: BorderSide(
            color: isSolid ? Colors.white : ZukunfColor.grey,
            width: 2.0,
          )),
      color: isSolid ? ZukunfColor.darkblue : Colors.white,
    );
  }
}
