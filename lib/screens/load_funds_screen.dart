import 'package:flutter/material.dart';
import 'package:panther_central_ios_app/screens/dashboard_screen.dart';
import 'package:panther_central_ios_app/screens/select_amount_screen.dart';
import 'package:panther_central_ios_app/screens/select_payment_screen.dart';
import 'package:panther_central_ios_app/models/custom_card_model.dart';
import 'package:panther_central_ios_app/viewModel/user_view_model.dart';
import 'package:panther_central_ios_app/models/address_model.dart';

class LoadFundsScreen extends StatefulWidget {
  final UserViewModel? user;

  const LoadFundsScreen(this.user);

  @override
  _LoadFundsScreenState createState() {
    return _LoadFundsScreenState();
  }
}

class _LoadFundsScreenState extends State<LoadFundsScreen> {
  List<String> items = <String>[r'$5.00', r'$10.00', r'$25.00', r'$50.00'];
  List<String> paymentMethods = <String>['Select Payment Method'];
  String? selectedItem = r'$5.00';
  String? paymentMethod = 'Select Payment Method';

  @override
  Widget build(BuildContext context) {
    const Color PC_YELLOW = Color.fromARGB(255, 255, 185, 29);
    const Color PC_BLUE = Color.fromARGB(255, 0, 53, 148);
    final UserViewModel? user = widget.user;

    getPaymentMethods(user);

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
                      const Align(child: Text('QUICK RELOAD')),
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
                    child: rowConstructor(user, null),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => SelectAmountScreen(user)));
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
                    value: selectedItem,
                    items: items
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Text(item,
                                      style: TextStyle(fontSize: 24))),
                            ))
                        .toList(),
                    onChanged: (item) => setState(() => selectedItem = item),
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
                    confirmPurchase(selectedItem!, user);
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

  void getPaymentMethods(UserViewModel? user) {
    List<CustomCard> cards = user!.cards;

    if (paymentMethods.length != cards.length + 1) {
      for (final c in cards) {
        var n = c.number
            .toString()
            .substring(16 - 4); // Get Last 4 digits from card
        paymentMethods.add(
            "Account ending in x$n"); // Append Last 4 digits to String "Card ending in x"; Append String to List
      }
    }
  }

  void confirmPurchase(String amount, UserViewModel? user) {
    user!.accounts["Panther Funds"] = (user!.accounts["Panther Funds"]! +
        double.parse(amount.substring(1)))!; // get current PF amount
  }

  Row rowConstructor(UserViewModel? user, CustomCard? card) {
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
      // Add payment method
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
      // Default Payment
      String lastFour = firstCard.number
          .toString()
          .substring(firstCard.number.toString().length - 4);
      String cardName = firstCard.name;
      String compound = "$cardName ending in x$lastFour";
      return Row(children: [
        creditCard,
        SizedBox(
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
