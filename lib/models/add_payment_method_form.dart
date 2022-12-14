import 'package:flutter/material.dart';
import 'package:panther_central_ios_app/models/address_model.dart';
import 'package:panther_central_ios_app/models/custom_card_list_model.dart';
import 'package:panther_central_ios_app/models/custom_card_model.dart';
import 'package:panther_central_ios_app/screens/choose_payment_screen.dart';
import 'package:panther_central_ios_app/viewModel/user_view_model.dart';
import 'package:provider/provider.dart';

class AddPaymentMethodForm extends StatelessWidget {
  UserViewModel user;

  // Card Info Text Fields
  final nameController = TextEditingController();
  final nameOnCardController = TextEditingController();
  final cardNumberController = TextEditingController();
  final expirationDateController = TextEditingController();
  final cvvController = TextEditingController();

  // Address Info Text Fields
  final lineOneController = TextEditingController();
  final lineTwoController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final zipController = TextEditingController();

  AddPaymentMethodForm(this.user); // the user who is adding a payment method

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: TextFormField(
            controller: nameController,
            decoration: const InputDecoration(
              filled: true,
              fillColor: Colors.white,
              labelText: 'Name',
            ),
          ),
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: TextFormField(
            controller: nameOnCardController,
            decoration: const InputDecoration(
              filled: true,
              fillColor: Colors.white,
              labelText: 'Name on Card',
            ),
          ),
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: TextFormField(
            controller: cardNumberController,
            decoration: const InputDecoration(
              filled: true,
              fillColor: Colors.white,
              labelText: 'Card Number',
            ),
          ),
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: TextFormField(
            controller: expirationDateController,
            decoration: const InputDecoration(
              filled: true,
              fillColor: Colors.white,
              labelText: 'Expiration Date',
            ),
          ),
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: TextFormField(
            controller: cvvController,
            decoration: const InputDecoration(
              filled: true,
              fillColor: Colors.white,
              labelText: 'CVV',
            ),
          ),
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: TextFormField(
            controller: lineOneController,
            decoration: const InputDecoration(
              filled: true,
              fillColor: Colors.white,
              labelText: 'Address Line 1',
            ),
          ),
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: TextFormField(
            controller: lineTwoController,
            decoration: const InputDecoration(
              filled: true,
              fillColor: Colors.white,
              labelText: 'Address Line 2',
            ),
          ),
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: TextFormField(
            controller: cityController,
            decoration: const InputDecoration(
              filled: true,
              fillColor: Colors.white,
              labelText: 'City',
            ),
          ),
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: TextFormField(
            controller: stateController,
            decoration: const InputDecoration(
              filled: true,
              fillColor: Colors.white,
              labelText: 'State',
            ),
          ),
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: TextFormField(
            controller: zipController,
            decoration: const InputDecoration(
              filled: true,
              fillColor: Colors.white,
              labelText: 'Zip Code',
            ),
          ),
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 15),
          child: Container(
            height: 50,
            width: 250,
            decoration: BoxDecoration(
                color: PC_YELLOW, borderRadius: BorderRadius.circular(20)),
            child: TextButton(
              onPressed: () {
                // call add payment method function with text field values
                addPaymentMethod(
                  nameController.text,
                  nameOnCardController.text,
                  cardNumberController.text,
                  expirationDateController.text,
                  cvvController.text,
                  lineOneController.text,
                  lineTwoController.text,
                  cityController.text,
                  stateController.text,
                  zipController.text,
                );
              },
              child: const Center(child: Text(
                'Add Payment Method',
                style: TextStyle(color: PC_BLUE, fontSize: 20),
              ),),
            ),
          ),
        ),
      ],
    );
  }

  String addPaymentMethod(
      String name,
      String nameOnCard,
      String cardNumber,
      String expirationDate,
      String cvv,
      String lineOne,
      String lineTwo,
      String city,
      String state,
      String zip) {
    var currCards = user.cards;
    var billing = Address(
        lineOne: lineOne,
        lineTwo: lineTwo,
        city: city,
        state: state,
        zip: zip); // create address object
    var card = CustomCard(
        name: name,
        nameOnCard: nameOnCard,
        number: int.parse(cardNumber),
        exp: expirationDate,
        cvv: int.parse(cvv),
        billing: billing); // create card object
    user.addCard(card);
    var newCards = user.cards;
    // check if the length of newCards is greater than the length of currCards
    var newSize = newCards.length;
    var currSize = currCards.length;
    if (newSize > currSize) {
      // if so, then the card was added
      return "Payment method added successfully!";
    } else {
      // if not, then the card was not added
      return "Payment method was not added.";
    }
  }
}
