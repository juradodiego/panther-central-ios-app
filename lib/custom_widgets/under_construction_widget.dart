
import 'package:flutter/material.dart';

class UnderConstruction extends StatelessWidget{
  const UnderConstruction({super.key});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: const <Widget>[
        Icon(
          Icons.warning_rounded,
          size: 75,
          color: Color.fromARGB(255, 255, 185, 29),
        ),
        Text(
          "Under Construction",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Color.fromARGB(255, 255, 185, 29)),
        ),
      ],
    );

  }

}