import 'package:flutter/material.dart';
import 'package:panther_central_ios_app/screens/select_payment_screen.dart';
import 'package:panther_central_ios_app/models/custom_card_model.dart';
import 'package:panther_central_ios_app/viewModel/user_view_model.dart';
import 'package:panther_central_ios_app/models/address_model.dart';

class LoadFundsScreen extends StatefulWidget {
  @override
  _LoadFundsScreenState createState() => _LoadFundsScreenState();
}

class _LoadFundsScreenState extends State<LoadFundsScreen> {

  List<String> items = <String>[r'$5.00', r'$10.00', r'$25.00', r'$50.00'];
  List<String> paymentMethods = <String>['Select Payment Method'];
  String? selectedItem = r'$5.00';
  String? paymentMethod = 'Select Payment Method';



  @override
  Widget build(BuildContext context) {
    const PC_YELLOW = Color.fromARGB(255, 255, 185, 29);
    const PC_BLUE = Color.fromARGB(255, 0, 53, 148);

    getPaymentMethods();

    return Scaffold(
      backgroundColor: PC_BLUE,
      /* GO BACK ICON BUTTON */
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(100), // Set this height
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Container(
              height: 75,
              width: 75,
              color: PC_BLUE,
              child: Row(children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios_new),
                    iconSize: 40,
                    color: PC_YELLOW,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ]),
            ),
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
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: paymentMethod,
                    items: paymentMethods
                        .map((method) => DropdownMenuItem<String>(
                      value: method,
                      child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(method,
                              style: TextStyle(fontSize: 24))),
                    ))
                        .toList(),
                    onChanged: (method) => setState(() => paymentMethod = method),
                    icon: Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Icon(Icons.arrow_forward_ios)),
                  ),
                ),
              ),
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
                    icon: Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Icon(Icons.arrow_drop_down)),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void getPaymentMethods() {
    // userViewModel.cards  // get Cards from UserViewModel
    // Iterate through Cards
    final cards = <CustomCard>[];
    final card_one = CustomCard(
        name: "Citi",
        nameOnCard: "James Polk",
        number: 1234567812345678,
        exp: "08/25",
        cvv: 123,
        billing: Address(
            lineOne: "123 Mulberry St.",
            lineTwo: "",
            city: "Pittsburgh",
            state: "PA",
            zip: "12345"));
    final card_two = CustomCard(
        name: "Citi",
        nameOnCard: "James Polk",
        number: 1234567812341234,
        exp: "08/25",
        cvv: 123,
        billing: Address(
            lineOne: "123 Mulberry St.",
            lineTwo: "",
            city: "Pittsburgh",
            state: "PA",
            zip: "12345"));
    cards.add(card_one);
    cards.add(card_two);

    if (paymentMethods.length != cards.length + 1){
      for (final c in cards){
        var n = c.number.toString().substring(16 - 4); // Get Last 4 digits from card
        paymentMethods.add("Account ending in x" + n); // Append Last 4 digits to String "Card ending in x"; Append String to List
      }
    }

  }
}
