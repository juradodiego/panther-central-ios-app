import 'package:flutter/material.dart';
import 'package:panther_central_ios_app/models/custom_card_model.dart';
import 'package:panther_central_ios_app/screens/add_payment_screen.dart';
import 'package:panther_central_ios_app/viewModel/user_view_model.dart';

const PC_YELLOW = Color.fromARGB(255, 255, 185, 29);
const PC_BLUE = Color.fromARGB(255, 0, 53, 148);

class ChoosePaymentScreen extends StatefulWidget {
  final UserViewModel? user;

  const ChoosePaymentScreen(this.user);

  @override
  _ChoosePaymentScreenState createState() {
    return _ChoosePaymentScreenState();
  }
}

class _ChoosePaymentScreenState extends State<ChoosePaymentScreen> {
  late final List<bool> _selections =
      List.generate(widget.user!.cards.length, (_) => false);

  @override
  Widget build(BuildContext context) {


    final UserViewModel? user = widget.user;

    return Scaffold(
      backgroundColor: PC_BLUE,
      /* GO BACK ICON BUTTON */
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
                )),
          )),
      body: SingleChildScrollView(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(),
          ToggleButtons(
            direction: Axis.vertical,
            onPressed: (int index) {
              setState(() {
                // The button that is tapped is set to true, and the others to false.
                for (int i = 0; i < _selections.length; i++) {
                  _selections[i] = i == index;
                }
              });
            },
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            selectedBorderColor: PC_BLUE,
            selectedColor: PC_BLUE,
            fillColor: PC_YELLOW,
            color: PC_YELLOW,
            isSelected: _selections,
            children: getCardButtons(user),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Container(
              height: 75,
              width: 350,
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
                  'Add New Payment Method',
                  style: TextStyle(color: PC_BLUE, fontSize: 25),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }

  List<Widget> getCardButtons(UserViewModel? user) {
    List<Widget> result = [];

    const creditCard = Icon(
      Icons.credit_card_rounded,
      size: 40,
    );
    CustomCard firstCard = user!.cards.first;

    for (final c in user.cards) {
      String cardName = c.name;
      String lastFour =
          c.number.toString().substring(c.number.toString().length - 4);
      String compound = "$cardName ending in x$lastFour";
      result.add(SizedBox(
          width: 350,
          height: 75,
          child: Row(children: [
            creditCard,
            const SizedBox(
              width: 5,
            ),
            Text(
              compound,
              style: const TextStyle(fontSize: 25),
            ),
          ])));
    }

    return result;
  }
}
