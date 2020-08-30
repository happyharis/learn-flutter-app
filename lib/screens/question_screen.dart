import 'package:flutter/material.dart';
import 'package:learn_flutter_app/constants/colors.dart';

class QuestionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ZukunfColor.blue,
        title: Text('Alignment'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 187,
              color: ZukunfColor.blue,
            )
          ],
        ),
      ),
    );
  }
}
