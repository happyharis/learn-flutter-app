import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_flutter_app/constants/colors.dart';

class ChallengeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Flutter Quizzes',
        ),
      ),
      body: ListView(
        children: [
          ChallengeCard(
            title: title,
            description: alignmentText,
            color: ZukunfColor.blue,
          ),
          ChallengeCard(
            title: 'Container',
            description:
                'Container widgets are at default a rectangle shape. How about a circle?',
            color: ZukunfColor.red,
          ),
          ChallengeCard(
            title: title,
            description: alignmentText,
            color: ZukunfColor.green,
          ),
        ],
      ),
    );
  }
}

class ChallengeCard extends StatelessWidget {
  final String title;
  final String description;
  final Color color;
  const ChallengeCard({
    Key key,
    @required this.title,
    @required this.description,
    @required this.color,
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
                onTap: () => Navigator.of(context).pushNamed('question'),
                child: Stack(
                  children: [
                    CardTitle(title),
                    Image(),
                    DescriptionText(description),
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

class Image extends StatelessWidget {
  const Image({
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

final alignmentText =
    'Alignments are great at positioning child widgets. Do you know how to position them outside the widget?';

final title = 'Alignment';
