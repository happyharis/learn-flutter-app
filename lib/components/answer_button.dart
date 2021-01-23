import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_flutter_app/constants/colors.dart';
import 'package:learn_flutter_app/models/choice.dart';
import 'package:learn_flutter_app/models/challenge.dart';

class AnswerButton extends StatelessWidget {
  final bool isTapped;
  final Function() onPressed;
  final Challenge question;
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
    final isChosenAnswer = question.chosenOptionId == choice.id;
    final isCorrect = isChosenAnswer == choice.isAnswer;
    final questionNotNull =
        question.chosenOptionId != null && question.isCompleted != null;

    Color handleButtonColour({
      Color whenTapped = ZukunfColor.yellow,
      Color whenNotTapped,
      Color whenCorrect = ZukunfColor.lightPurple,
      Color whenWrong = ZukunfColor.yellow,
      Color whenCompleted = Colors.white,
      Color whenNotChosenAnswer = ZukunfColor.purple,
    }) {
      if (questionNotNull && question.isCompleted) {
        if (isCorrect) return whenCorrect;
        if (!isCorrect && choice.isAnswer == true) return whenNotChosenAnswer;
        if (!isCorrect && isChosenAnswer) return whenWrong;

        // Other choices not chosen
        return whenCompleted;
      }
      return isTapped ?? false ? whenTapped : whenNotTapped;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.only(left: 20),
          backgroundColor: handleButtonColour(
            whenNotTapped: Colors.white,
            whenNotChosenAnswer: Colors.white,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(38),
            side: BorderSide(
              color: handleButtonColour(whenNotTapped: ZukunfColor.blue),
              width: 2.0,
            ),
          ),
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              choice.text,
              style: GoogleFonts.montserrat(
                fontSize: 18,
                textStyle: TextStyle(
                  color: handleButtonColour(
                    whenTapped: Colors.black,
                    whenNotTapped: Colors.black,
                    whenCompleted: Colors.black.withOpacity(0.46),
                    whenWrong: Colors.black.withOpacity(0.46),
                    whenNotChosenAnswer: Colors.black,
                    whenCorrect: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        onPressed: question.isCompleted ?? false ? null : onPressed,
      ),
    );
  }
}
