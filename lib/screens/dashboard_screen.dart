import 'package:flutter/material.dart';

import 'package:panther_central_ios_app/custom_widgets/under_construction_widget.dart';
import 'package:panther_central_ios_app/models/transaction_model.dart';
import 'package:panther_central_ios_app/models/transactions_graph_model.dart';
import 'package:panther_central_ios_app/screens/load_funds_screen.dart';
import 'package:panther_central_ios_app/screens/settings_screen.dart';
import 'package:panther_central_ios_app/viewModel/user_view_model.dart';

import '../models/user_model.dart';

const List<Widget> toggle = <Widget>[
  Text('D'),
  Text('M'),
  Text('Y')
];

class DashboardScreen extends StatefulWidget {
  final UserViewModel? user;

  const DashboardScreen(this.user);

  @override
  _DashboardScreenState createState() {
    return _DashboardScreenState();
  }
}

class _DashboardScreenState extends State<DashboardScreen> {
  final List<bool> _selectedToggle = <bool>[false, true, false];
  //#region PAGE CONTROLLER
  PageController pageController = PageController(initialPage: 1);
  // PageController (0: Acct | 1: Dash | 2: Trans M | 3: Trans D | 4: Trans Y)
  int _selectedIndex = 1;

  String getCurrentToggle(List<bool> boolArr) {
    if (boolArr[0]) {
      return "D";
    } else if (boolArr[1]) {
      return "M";
    } else {
      return "Y";
    }
  }

  void _onPageChange(int page) {
    setState(() {
      _selectedIndex = page;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    pageController.jumpToPage(_selectedIndex);
  }

  //#endregion
  @override
  Widget build(BuildContext context) {
    // Panther Central Theme Colors
    const Color PC_YELLOW = Color.fromARGB(255, 255, 185, 29);
    const Color PC_BLUE = Color.fromARGB(255, 0, 53, 148);
    final UserViewModel? user =
        widget.user; // UserViewModel for getting and setting data

    return Scaffold(
        backgroundColor: PC_BLUE,
        /* APPBAR: PANTHER CENTRAL LOGO + SETTINGS BUTTON */
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100), // Set this height
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Container(
              color: PC_BLUE,
              child: Row(
                children: <Widget>[
                  //#region PANTHER CENTRAL LOGO
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: SizedBox(
                        width: 75,
                        height: 75,
                        child: Image.asset(
                            'assets/images/panther-central-logo.png')),
                  ),
                  //#endregion
                  const Spacer(),
                  //#region SETTINGS SCREEN BUTTON
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: IconButton(
                      icon: const Icon(Icons.settings),
                      iconSize: 60,
                      color: PC_YELLOW,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => SettingsScreen(user)));
                      },
                    ),
                  ),
                  //#endregion
                ],
              ),
            ),
          ),
        ),
        /* BODY: DISPLAY FOR DASHBOARD, ACCOUNTS, TRANSACTIONS */
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          onPageChanged: _onPageChange,
          children: [
            //#region ACCOUNTS SCREEN
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  //#region PANTHER FUNDS BALANCE DISPLAY
                  const Text(
                    "Panther Funds",
                    style: TextStyle(
                        color: PC_YELLOW,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Container(
                      height: 75,
                      width: 350,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          r'$' + user!.accounts["Panther Funds"].toString(),
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
                        color: PC_YELLOW,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Container(
                      height: 75,
                      width: 350,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          r'$' + user!.accounts["Dining Dollars"].toString(),
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
                        color: PC_YELLOW,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  /* OFF-CAMPUS DD ACCOUNT */
                  // TODO Display Account Balance
                  Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Container(
                      height: 75,
                      width: 350,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          r'$' + user!.accounts["OC Dining Dollars"].toString(),
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
                        color: PC_YELLOW,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Container(
                      height: 75,
                      width: 350,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          r'$' +
                              user!.accounts["Add. Dining Dollars"].toString(),
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
                        color: PC_YELLOW,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Container(
                      height: 75,
                      width: 350,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          r'$' + user!.accounts["Bonus Bucks"].toString(),
                          style: const TextStyle(fontSize: 40),
                        ),
                      ),
                    ),
                  ),
                  //# endregion
                ],
              ),
            ),
            //#endregion
            //#region DASHBOARD SCREEN
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  //#region PANTHER FUNDS BALANCE DISPLAY

                  const Text(
                    "Panther Funds",
                    style: TextStyle(
                        color: PC_YELLOW,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Container(
                      height: 75,
                      width: 350,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          r'$' + user!.accounts["Panther Funds"].toString(),
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
                        color: PC_YELLOW,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Container(
                      height: 75,
                      width: 350,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          r'$' + user!.accounts["Dining Dollars"].toString(),
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
                        color: PC_YELLOW,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  /* OFF-CAMPUS DD ACCOUNT */
                  // TODO Display Account Balance
                  Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Container(
                      height: 75,
                      width: 350,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          r'$' + user!.accounts["OC Dining Dollars"].toString(),
                          style: const TextStyle(fontSize: 40),
                        ),
                      ),
                    ),
                  ),
                  //#endregion
                ],
              ),
            ),
            //#endregion
            //#region TRANSACTIONS SCREEN M
            SingleChildScrollView(
                child: SizedBox(
              child: Column(
                children: [
                  Row(
                    children: [
                      const Spacer(),
                      Padding(padding: const EdgeInsets.only(right: 20, top: 10),
                      child: ToggleButtons(
                        direction: Axis.horizontal,
                        onPressed: (int index) {
                          setState(() {
                            // The button that is tapped is set to true, and the others to false.
                            for (int i = 0; i < _selectedToggle.length; i++) {
                              _selectedToggle[i] = i == index;
                            }
                          });
                        },
                        borderRadius: const BorderRadius.all(Radius.circular(8)),
                        selectedBorderColor: PC_BLUE,
                        selectedColor: PC_BLUE,
                        fillColor: PC_YELLOW,
                        color: PC_YELLOW,
                        constraints: const BoxConstraints(
                          minHeight: 40.0,
                          minWidth: 40.0,
                        ),
                        isSelected: _selectedToggle,
                        children: toggle,
                      ))
                    ],
                  ),
                  const SizedBox(height: 10,),
                  SizedBox(height: 250, width: 350, child: TransactionsGraph(user, getCurrentToggle(_selectedToggle)),)
                  ,
                ],
              ),

            )),

          ],
        ),
        /* NAVBAR: NAVIGATION BUTTONS BETWEEN DASHBOARD, ACCOUNTS, TRANSACTIONS */
        bottomNavigationBar: Container(
          width: MediaQuery. of(context). size. width,
          height: 120,
          decoration: BoxDecoration( borderRadius: BorderRadius.circular(50)),
          child: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.attach_money),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bar_chart_sharp,),
                label: '',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: PC_BLUE,
            onTap: _onItemTapped,
            backgroundColor: PC_YELLOW,
            iconSize: 50.0,
          ),
        ));
  }

}



