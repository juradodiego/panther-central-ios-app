import 'package:flutter/material.dart';
import 'package:panther_central_ios_app/models/add_payment_method_form.dart';
import 'package:panther_central_ios_app/models/custom_card_model.dart';
import 'package:panther_central_ios_app/viewModel/user_view_model.dart';



class AddPaymentScreen extends StatefulWidget {
  final UserViewModel? user;

  const AddPaymentScreen(this.user, {super.key});

  @override
  _AddPaymentScreenState createState() {
    return _AddPaymentScreenState();
  }
}

class _AddPaymentScreenState extends State<AddPaymentScreen> {
  @override
  Widget build(BuildContext context) {
    const pcYellow = Color.fromARGB(255, 255, 185, 29);
    const pcBlue = Color.fromARGB(255, 0, 53, 148);
    final UserViewModel? user = widget.user;

    return Scaffold(
        backgroundColor: pcBlue,
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
                        const Align(child: Text('ADD PAYMENT METHOD', style: TextStyle(color: pcYellow, fontSize: 23,),)),
                        Positioned(
                          right: 10,
                          child: IconButton(
                            icon: const Icon(Icons.close_rounded),
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
            child: Column(children: <Widget>[
              const Center(),
              AddPaymentMethodForm(user!),

        ])));
  }

  void addPaymentMethod(UserViewModel user, CustomCard card) {
    user.cards.add(card);
  }
}
