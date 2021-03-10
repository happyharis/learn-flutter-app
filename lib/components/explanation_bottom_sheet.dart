import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExplanationBottomSheet extends StatelessWidget {
  final String explanationText;
  final String explanationImage;

  const ExplanationBottomSheet({
    Key key,
    this.explanationText,
    this.explanationImage,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18),
      height: height * 0.93,
      child: Column(
        children: [
          SizedBox(height: 21),
          Text(
            'Explanation',
            style: GoogleFonts.montserrat(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 18),
          Row(
            children: [
              Flexible(child: Image.network(explanationImage)),
              // Image.network(explanationImage)
            ],
          ),
          SizedBox(height: 15),
          Row(children: [
            Expanded(
              child: Text(
                explanationText,
                overflow: TextOverflow.clip,
              ),
            )
          ]),
        ],
      ),
    );
  }
}
