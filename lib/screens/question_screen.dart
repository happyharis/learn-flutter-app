import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_flutter_app/components/explanation_bottom_sheet.dart';
import 'package:learn_flutter_app/components/list_answer_button_view.dart';
import 'package:learn_flutter_app/constants/colors.dart';
import 'package:learn_flutter_app/models/question.dart';
import 'package:learn_flutter_app/models/question_notifier.dart';
import 'package:learn_flutter_app/screens/challenge_screen.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

class QuestionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _question = question;
    return ChangeNotifierProxyProvider0<QuestionNotifier>(
      create: (context) => QuestionNotifier(),
      update: (_, questionNotifier) {
        return questionNotifier..initialise(_question);
      },
      builder: (context, _) {
        final questionNotifier = Provider.of<QuestionNotifier>(context);

        final _isCompleted =
            questionNotifier.currentQuestion.isCompleted ?? false;
        final _hasPickedAnswer =
            questionNotifier.currentQuestion.isCorrect != null;
        return Scaffold(
          appBar: AppBar(
            bottom: _hasPickedAnswer && _isCompleted ? ResultBottomBar() : null,
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
                    children: [CardTitle('Alignment'), CardImage()],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 35.0, vertical: 38),
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
                        child: Text(_question.text),
                      ),
                      ListAnswerButtonView(answers: _question.options),
                      SizedBox(height: 15),
                      ZukunfButton.solid(
                        text: _isCompleted ?? false ? 'Continue' : 'Submit',
                        onPressed: () {
                          if (_hasPickedAnswer) {
                            questionNotifier.updateCompletion(true);
                            if (_isCompleted) Navigator.of(context).pop();
                          }
                        },
                      ),
                      SizedBox(height: 20),
                      ZukunfButton(
                        text: 'Show Explanation',
                        onPressed: () {
                          showMaterialModalBottomSheet(
                            context: context,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(18),
                                topRight: Radius.circular(18),
                              ),
                            ),
                            builder: (context) {
                              return ExplanationBottomSheet();
                            },
                          );
                        },
                      ),
                      SizedBox(height: 32),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ResultBottomBar extends StatelessWidget implements PreferredSize {
  const ResultBottomBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isCorrect = context.select<QuestionNotifier, bool>((notifier) {
      return notifier.currentQuestion.isCorrect ?? false;
    });
    return Container(
      color: Colors.grey.shade400,
      alignment: AlignmentDirectional.center,
      child: Text(
        isCorrect
            ? '✅ You got it right. Let\'s do the next one'
            : '❌ You were close getting it right!',
        style: GoogleFonts.montserrat(),
      ),
      height: 44.0,
    );
  }

  @override
  Widget get child => SizedBox();

  @override
  Size get preferredSize => Size.fromHeight(44);
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
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.all(10),
        minimumSize: Size(double.infinity, 10),
        backgroundColor: isSolid ? ZukunfColor.darkblue : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: BorderSide(
            color: isSolid ? Colors.white : ZukunfColor.grey,
            width: 2.0,
          ),
        ),
      ),
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
    );
  }
}
