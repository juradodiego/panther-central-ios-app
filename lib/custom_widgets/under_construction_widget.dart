
import 'package:flutter/material.dart';

class UnderConstruction extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const <Widget>[
        Icon(
          Icons.warning_rounded,
          size: 75,
          color: const Color.fromARGB(255, 255, 185, 29),
        ),
        Text(
          "Under Construction",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 255, 185, 29)),
        ),
      ],
    );

  }

}