import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_flutter_app/constants/colors.dart';

class AnswerButton extends StatelessWidget {
  final String answer;
  final bool isTapped;
  final Function() onPressed;
  final bool isCompleted;
  final bool isCorrect;

  const AnswerButton({
    Key key,
    @required this.answer,
    @required this.isTapped,
    this.onPressed,
    this.isCompleted,
    this.isCorrect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              answer,
              style: GoogleFonts.montserrat(fontSize: 18),
            ),
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
