import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Questions extends StatelessWidget {
  //const Questions({Key? key}) : super(key: key);
  final String questionText;

  Questions(this.questionText, {Key? key}) : super(key: key);

  String a = "asd";

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.all(10),
        child: Text(
          questionText,
          style: const TextStyle(fontSize: 28),
          textAlign: TextAlign.center,
        ));
  }
}
