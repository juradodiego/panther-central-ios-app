import 'package:flutter/material.dart';
import 'package:panther_central_ios_app/screens/load_funds_screen.dart';
import 'package:panther_central_ios_app/viewModel/user_view_model.dart';

class DashboardScreen extends StatelessWidget {
  UserViewModel user;

  DashboardScreen(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    const Color PC_YELLOW = Color.fromARGB(255, 255, 185, 29);
    const Color PC_BLUE = Color.fromARGB(255, 0, 53, 148);

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          //#region PANTHER FUNDS BALANCE DISPLAY

          const Text(
            "Panther Funds",
            style: TextStyle(
                color: PC_YELLOW, fontSize: 20, fontWeight: FontWeight.bold),
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
          //#region LOAD PANTHER FUNDS BUTTON
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0),
            child: SizedBox(
              height: 75,
              width: 350,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: PC_YELLOW,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => LoadFundsScreen(user)));
                  },
                  child: Row(
                    children: const [
                      Text(
                        'Load More Panther Funds',
                        style: TextStyle(
                            color: PC_BLUE,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 25,
                        color: PC_BLUE,
                      )
                    ],
                  )),
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
                color: PC_YELLOW, fontSize: 20, fontWeight: FontWeight.bold),
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
                color: PC_YELLOW, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          /* OFF-CAMPUS DD ACCOUNT */
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
        ],
      ),
    );
  }
}
