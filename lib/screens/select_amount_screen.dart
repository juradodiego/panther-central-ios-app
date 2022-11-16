import 'package:flutter/material.dart';
import 'package:panther_central_ios_app/screens/add_payment_screen.dart';
import 'package:panther_central_ios_app/viewModel/user_view_model.dart';

class SelectAmountScreen extends StatefulWidget {
  final UserViewModel? user;

  const SelectAmountScreen(this.user);

  @override
  _SelectAmountScreenState createState() {
    return _SelectAmountScreenState();
  }
}

class _SelectAmountScreenState extends State<SelectAmountScreen> {
  @override
  Widget build(BuildContext context) {
    const PC_YELLOW = Color.fromARGB(255, 255, 185, 29);
    const PC_BLUE = Color.fromARGB(255, 0, 53, 148);
    final UserViewModel? user = widget.user;

    return Scaffold(
        backgroundColor: PC_BLUE,
        /* GO BACK ICON BUTTON */
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(100), // Set this height
            child: Container(
              color: PC_BLUE,
              child: IntrinsicHeight(
                child: Stack(
                  children: [
                    // TODO Add Font Size, Font Color
                    const Align(child: Text('CHOOSE PAYMENT')),
                    Positioned(
                      left: 10,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back_ios),
                        iconSize: 40,
                        color: PC_YELLOW,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )),
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
          // TODO List of Payment Methods
          // TODO Add Payment Method Link
          // TODO When Payment Method is Added the Screen Updates
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: PC_YELLOW, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => AddPaymentScreen(user)));
                },
                child: const Text(
                  'ADD PAYMENT METHOD',
                  style: TextStyle(color: PC_BLUE, fontSize: 25),
                ),
              ),
            ),
          ),
        ])));
  }
}
