import 'package:flutter/material.dart';
import 'package:panther_central_ios_app/viewModel/user_view_model.dart';

class AccountScreen extends StatelessWidget {
  UserViewModel user;

  AccountScreen(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    const Color pcYellow = Color.fromARGB(255, 255, 185, 29);

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          //#region PANTHER FUNDS BALANCE DISPLAY
          const Text(
            "Panther Funds",
            style: TextStyle(
                color: pcYellow, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Container(
              height: 75,
              width: 350,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Text(
                  r'$' + user.accounts["Panther Funds"].toString(),
                  style: const TextStyle(fontSize: 40),
                ),
              ),
            ),
          ),
          //#endregion
          //#region DINING DOLLARS BALANCE DISPLAY
          const SizedBox(
            height: 15,
          ),
          const Text(
            "Dining Dollars",
            style: TextStyle(
                color: pcYellow, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Container(
              height: 75,
              width: 350,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Text(
                  r'$' + user.accounts["Dining Dollars"].toString(),
                  style: const TextStyle(fontSize: 40),
                ),
              ),
            ),
          ),
          //# endregion
          //#region OFF-CAMPUS DINING DOLLARS BALANCE DISPLAY
          const SizedBox(
            height: 15,
          ),
          const Text(
            "Off-Campus Dining Dollars",
            style: TextStyle(
                color: pcYellow, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          /* OFF-CAMPUS DD ACCOUNT */
          // TODO Display Account Balance
          Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Container(
              height: 75,
              width: 350,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Text(
                  r'$' + user.accounts["OC Dining Dollars"].toString(),
                  style: const TextStyle(fontSize: 40),
                ),
              ),
            ),
          ),
          //#endregion
          //#region ADD. DINING DOLLARS BALANCE DISPLAY
          const SizedBox(
            height: 15,
          ),
          const Text(
            "Add. Dining Dollars",
            style: TextStyle(
                color: pcYellow, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Container(
              height: 75,
              width: 350,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Text(
                  r'$' + user.accounts["Add. Dining Dollars"].toString(),
                  style: const TextStyle(fontSize: 40),
                ),
              ),
            ),
          ),
          //# endregion
          //#region BONUS BUCKS BALANCE DISPLAY
          const SizedBox(
            height: 15,
          ),
          const Text(
            "Bonus Bucks",
            style: TextStyle(
                color: pcYellow, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Container(
              height: 75,
              width: 350,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Text(
                  r'$' + user.accounts["Bonus Bucks"].toString(),
                  style: const TextStyle(fontSize: 40),
                ),
              ),
            ),
          ),
          //# endregion
        ],
      ),
    );
  }
}
