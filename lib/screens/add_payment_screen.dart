import 'package:flutter/material.dart';
import 'package:panther_central_ios_app/custom_widgets/under_construction_widget.dart';
import 'package:panther_central_ios_app/models/custom_card_model.dart';
import 'package:panther_central_ios_app/viewModel/user_view_model.dart';

class AddPaymentScreen extends StatefulWidget {
  final UserViewModel? user;

  const AddPaymentScreen(this.user);

  @override
  _AddPaymentScreenState createState() {
    return _AddPaymentScreenState();
  }
}

class _AddPaymentScreenState extends State<AddPaymentScreen> {
  @override
  Widget build(BuildContext context) {
    const PC_YELLOW = Color.fromARGB(255, 255, 185, 29);
    const PC_BLUE = Color.fromARGB(255, 0, 53, 148);
    final UserViewModel? user = widget.user;

    return Scaffold(
        backgroundColor: PC_BLUE,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100), // Set this height
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Container(
                  height: 75,
                  width: 75,
                  color: PC_BLUE,
                  child: IntrinsicHeight(
                    child: Stack(
                      children: [
                        // TODO Add Font Size, Font Color
                        const Align(child: Text('ADD PAYMENT METHOD', style: TextStyle(color: PC_YELLOW, fontSize: 23),)),
                        Positioned(
                          right: 10,
                          child: IconButton(
                            icon: const Icon(Icons.close_rounded),
                            iconSize: 40,
                            color: PC_YELLOW,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  )),
            )),
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
              Center(),
              UnderConstruction(),
          // TODO Add Form Fields
          // TODO Add Add Payment Method Method Button
        ])));
  }

  void addPaymentMethod(UserViewModel user, CustomCard card) {
    user.cards.add(card);
  }
}
