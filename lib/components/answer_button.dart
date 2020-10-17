import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_flutter_app/constants/colors.dart';
import 'package:learn_flutter_app/models/choice.dart';
import 'package:learn_flutter_app/models/question.dart';

class AnswerButton extends StatelessWidget {
  final bool isTapped;
  final Function() onPressed;
  final Question question;
  final Choice choice;

  const AnswerButton({
    Key key,
    @required this.isTapped,
    this.onPressed,
    this.question,
    this.choice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color handleColour() {
      if (question.chosenAnswerId != null && question.isCompleted != null) {
        final isChosenAnswer = question.chosenAnswerId == choice.id;
        final isCorrect = isChosenAnswer == choice.isAnswer;
        if (isCorrect && question.isCompleted) {
          return ZukunfColor.lightPurple;
        }
      }
      return isTapped ?? false ? ZukunfColor.yellow : Colors.white;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: FlatButton(
        color: handleColour(),
        minWidth: double.infinity,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(38),
          side: BorderSide(
            color: isTapped ?? false ? ZukunfColor.yellow : ZukunfColor.blue,
            width: 2.0,
          ),
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              choice.text,
              style: GoogleFonts.montserrat(fontSize: 18),
            ),
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }

  Widget buildButtonOfUnansweredQn() {
    return FlatButton(
      color: isTapped ?? false ? ZukunfColor.yellow : Colors.white,
      minWidth: double.infinity,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(38),
        side: BorderSide(
          color: isTapped ?? false ? ZukunfColor.yellow : ZukunfColor.blue,
          width: 2.0,
        ),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(
            choice.text,
            style: GoogleFonts.montserrat(fontSize: 18),
          ),
        ),
      ),
      onPressed: onPressed,
    );
  }

  Widget buildButtonOfAnsweredQn() {
    return FlatButton(
      color: isTapped ?? false ? ZukunfColor.yellow : Colors.white,
      minWidth: double.infinity,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(38),
        side: BorderSide(
          color: isTapped ?? false ? ZukunfColor.yellow : ZukunfColor.blue,
          width: 2.0,
        ),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(
            choice.text,
            style: GoogleFonts.montserrat(fontSize: 18),
          ),
        ),
      ),
      onPressed: onPressed,
    );
  }

// void colorRenderStatus() {
//   if(i)
// }
}
