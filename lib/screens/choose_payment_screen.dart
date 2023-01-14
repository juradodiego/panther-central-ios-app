import 'package:flutter/material.dart';
import 'package:panther_central_ios_app/screens/add_payment_screen.dart';
import 'package:panther_central_ios_app/viewModel/user_view_model.dart';

const pcYellow = Color.fromARGB(255, 255, 185, 29);
const pcBlue = Color.fromARGB(255, 0, 53, 148);

class ChoosePaymentScreen extends StatefulWidget {
  final UserViewModel? user;

  const ChoosePaymentScreen(this.user, {super.key});

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
      backgroundColor: pcBlue,
      /* GO BACK ICON BUTTON */
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100), // Set this height
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Container(
                height: 75,
                width: 75,
                color: pcBlue,
                child: IntrinsicHeight(
                  child: Stack(
                    children: [
                      // TODO Add Font Size, Font Color
                      const Align(child: Text('CHOOSE PAYMENT', style: TextStyle(color: pcYellow, fontSize: 23,))),
                      Positioned(
                        left: 10,
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back_ios),
                          iconSize: 40,
                          color: pcYellow,
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
          const Center(),
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
            selectedBorderColor: pcBlue,
            selectedColor: pcBlue,
            fillColor: pcYellow,
            color: pcYellow,
            isSelected: _selections,
            children: getCardButtons(user),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Container(
              height: 75,
              width: 350,
              decoration: BoxDecoration(
                  color: pcYellow, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => AddPaymentScreen(user)));
                },
                child: const Text(
                  'Add New Payment Method',
                  style: TextStyle(color: pcBlue, fontSize: 22, fontWeight: FontWeight.bold),
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

    if (user != null) {
      for (final card in user.cards) {
        String cardName = card.name;
        String lastFour =
        card.number.toString().substring(card.number.toString().length - 4);
        String compound = "$cardName ending in x$lastFour";
        result.add(SizedBox(
            width: 350,
            height: 75,
            child: Row(children: [
              const SizedBox(
                width: 10,
              ),
              creditCard,
              const SizedBox(
                width: 5,
              ),
              Text(
                compound,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              const Icon(Icons.check_circle, color: pcBlue, size: 30,),
              const SizedBox(
                width: 10,
              ),
            ])));
      }
    }

    return result;
  }
}
