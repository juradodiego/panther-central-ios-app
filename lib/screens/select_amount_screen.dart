import 'package:flutter/material.dart';

import 'package:panther_central_ios_app/viewModel/users_view_model.dart';

class SelectAmountScreen extends StatefulWidget {
  @override
  _SelectAmountScreenState createState() => _SelectAmountScreenState();
}

class _SelectAmountScreenState extends State<SelectAmountScreen> {

  @override
  Widget build(BuildContext context) {
    const PC_YELLOW = Color.fromARGB(255, 255, 185, 29);
    const PC_BLUE = Color.fromARGB(255, 0, 53, 148);

    return Scaffold(
        backgroundColor: PC_BLUE,
        /* GO BACK ICON BUTTON */
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(100), // Set this height
            child: Container(
                color: PC_BLUE,
                child: Row(children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 30.0),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_ios_new),
                      iconSize: 40,
                      color: PC_YELLOW,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ]))),
        body: SingleChildScrollView(child: Column(children: <Widget>[])));
  }
}
