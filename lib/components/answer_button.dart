import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_flutter_app/constants/colors.dart';
import 'package:learn_flutter_app/models/answer.dart';
import 'package:learn_flutter_app/models/question.dart';

class AnswerButton extends StatelessWidget {
  final bool isTapped;
  final Function() onPressed;
  final Question question;
  final Answer answer;

  const AnswerButton({
    Key key,
    @required this.isTapped,
    this.onPressed,
    this.question,
    this.answer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final chosenAnswerId = question.chosenAnswerId;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: FlatButton(
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
              answer.text,
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
            answer.text,
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
            answer.text,
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
