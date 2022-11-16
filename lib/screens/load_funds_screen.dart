import 'package:flutter/material.dart';
import 'package:panther_central_ios_app/screens/dashboard_screen.dart';
import 'package:panther_central_ios_app/screens/choose_payment_screen.dart';
import 'package:panther_central_ios_app/models/custom_card_model.dart';
import 'package:panther_central_ios_app/viewModel/user_view_model.dart';

class LoadFundsScreen extends StatefulWidget {
  final UserViewModel? user;

  const LoadFundsScreen(this.user);

  @override
  _LoadFundsScreenState createState() {
    return _LoadFundsScreenState();
  }
}

class _LoadFundsScreenState extends State<LoadFundsScreen> {
  List<String> amounts = <String>[r'$5.00', r'$10.00', r'$25.00', r'$50.00'];
  String? selectedAmount = r'$5.00';


  @override
  Widget build(BuildContext context) {
    const Color PC_YELLOW = Color.fromARGB(255, 255, 185, 29);
    const Color PC_BLUE = Color.fromARGB(255, 0, 53, 148);
    final UserViewModel? user = widget.user;

    return Scaffold(
      backgroundColor: PC_BLUE,
      /* APPBAR: BACK OUT BUTTON + PAGE TITLE */
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
                      const Align(child: Text('QUICK RELOAD', style: TextStyle(color: PC_YELLOW, fontSize: 24),)),
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
      /* BODY: CHOOSE PAYMENT BUTTON + SELECT AMOUNT DROPDOWN + CONFIRM PURCHASE BUTTON */
      body: Center(
        child: Column(
          children: <Widget>[
            /* Select Payment Method */
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Container(
                  width: 350,
                  height: 75,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: ElevatedButton(
                    child: paymentMethodRow(user, null),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => ChoosePaymentScreen(user)));
                    },
                  )),
            ),
            /* SELECT AMOUNT DROPDOWN MENU */
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Container(
                width: 350,
                height: 75,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: selectedAmount,
                    items: amounts
                        .map((amount) => DropdownMenuItem<String>(
                              value: amount,
                              child: Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Text(amount,
                                      style: const TextStyle(fontSize: 24))),
                            ))
                        .toList(),
                    onChanged: (item) => setState(() => selectedAmount = item),
                    icon: const Padding(
                        padding: EdgeInsets.only(right: 15),
                        child: Icon(Icons.arrow_drop_down)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: PC_YELLOW, borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                  onPressed: () {
                    confirmPurchase(selectedAmount!, user);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => DashboardScreen(user)));
                  },
                  child: const Text(
                    'Confirm',
                    style: TextStyle(color: PC_BLUE, fontSize: 25),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void confirmPurchase(String amount, UserViewModel? user) {
    user!.accounts["Panther Funds"] = (user!.accounts["Panther Funds"]! +
        double.parse(amount.substring(1)))!; // get current PF amount
  }

  Row paymentMethodRow(UserViewModel? user, CustomCard? card) {
    const creditCard = Icon(Icons.credit_card_rounded);
    const arrowIcon = Icon(Icons.arrow_forward_ios);
    CustomCard firstCard = user!.cards.first;

    if (card != null && card != firstCard) {
      String cardName = card.name;
      String lastFour =
          card.number.toString().substring(card.number.toString().length - 4);
      String compound = "$cardName ending in x$lastFour";
      return Row(
        children: [
          creditCard,
          Text(
            compound,
            style: const TextStyle(fontSize: 24),
          ),
          const Spacer(),
          arrowIcon,
        ],
      );
    } else if (card == null && card == firstCard) {
      return Row(
        children: const [
          Text(
            "Add Payment Method",
            style: TextStyle(fontSize: 24),
          ),
          Spacer(),
          arrowIcon,
        ],
      );
    } else {
      String cardName = firstCard.name;
      String lastFour = firstCard.number
          .toString()
          .substring(firstCard.number.toString().length - 4);
      String compound = "$cardName ending in x$lastFour";
      return Row(children: [
        creditCard,
        const SizedBox(
          width: 5,
        ),
        Text(
          compound,
          style: const TextStyle(fontSize: 20),
        ),
        const Spacer(),
        arrowIcon,
      ]);
    }
  }
}
