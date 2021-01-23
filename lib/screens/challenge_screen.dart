import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_flutter_app/constants/colors.dart';
import 'package:learn_flutter_app/models/challenge.dart';
import 'package:learn_flutter_app/screens/question_screen.dart';
import 'package:provider/provider.dart';

class ChallengeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final challenges = context.watch<List<Challenge>>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Flutter Challenges',
        ),
      ),
      body: ListView(
        children: [
          for (var challenge in challenges)
            ChallengeCard(
              challenge: challenge,
              color: ZukunfColor.blue,
            ),
        ],
      ),
    );
  }
}

class ChallengeCard extends StatelessWidget {
  final Challenge challenge;
  final Color color;
  const ChallengeCard({
    Key key,
    @required this.color,
    @required this.challenge,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      child: AspectRatio(
        aspectRatio: 3 / 2.5,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 23, horizontal: 26),
          child: Material(
            elevation: 2,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Ink(
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: InkWell(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return QuestionScreen(challenge: challenge);
                    },
                  ),
                ),
                child: Stack(
                  children: [
                    CardTitle(challenge.cardTitleText),
                    CardImage(),
                    DescriptionText(challenge.cardDescription),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DescriptionText extends StatelessWidget {
  final String description;
  const DescriptionText(
    this.description, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: AutoSizeText(
          description,
          maxLines: 3,
          style: TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}

class CardImage extends StatelessWidget {
  const CardImage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: 136,
        height: 64,
        color: ZukunfColor.green,
        child: Center(
          child: Container(
            width: 23,
            height: 23,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ZukunfColor.red,
            ),
          ),
        ),
      ),
    );
  }
}

class CardTitle extends StatelessWidget {
  final String title;
  const CardTitle(
    this.title, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 40),
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            title,
            style: GoogleFonts.montserrat(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
