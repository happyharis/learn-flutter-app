import 'package:flutter/material.dart';
import 'package:learn_flutter_app/models/challenge.dart';
import 'package:learn_flutter_app/screens/challenge_screen.dart';
import 'package:learn_flutter_app/screens/question_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learn Flutter App',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.white,
          textTheme: TextTheme(
            headline6: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(color: Colors.black),
          ),
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
        ),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (_) => ChallengeScreen(),
        'question': (_) => QuestionScreen(question: question),
      },
    );
  }
}
