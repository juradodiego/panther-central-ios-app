import 'package:flutter/material.dart';

import 'package:panther_central_ios_app/custom_widgets/under_construction_widget.dart';
import 'package:panther_central_ios_app/screens/load_funds_screen.dart';
import 'package:panther_central_ios_app/screens/settings_screen.dart';
import 'package:panther_central_ios_app/viewModel/user_view_model.dart';

class DashboardScreen extends StatefulWidget {
  final UserViewModel? user;

  const DashboardScreen(this.user);

  @override
  _DashboardScreenState createState() {
    return _DashboardScreenState();
  }
}

class _DashboardScreenState extends State<DashboardScreen> {
  //#region PAGE CONTROLLER
  PageController pageController = PageController(initialPage: 1);
  int _selectedIndex = 1;

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
    final UserViewModel? user = widget.user; // UserViewModel for getting and setting data

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
                                builder: (_) => SettingsScreen()));
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
          controller: pageController,
          children: [
            //#region ACCOUNTS SCREEN
            SingleChildScrollView(
              child: UnderConstruction(),
            ),
            //#endregion
            //#region DASHBOARD SCREEN
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  //#region PANTHER FUNDS BALANCE DISPLAY
                  const Text("Panther Funds"),
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
                  const Text(""),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
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
                                style: TextStyle(color: PC_BLUE, fontSize: 22),
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
                  const Text("Dining Dollars"),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
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
                  const Text("Off- Campus Dining Dollars"),
                  /* OFF-CAMPUS DD ACCOUNT */
                  // TODO Display Account Balance
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
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
            //#region TRANSACTIONS SCREEN
            SingleChildScrollView(
              child: UnderConstruction(),
            )
            //#endregion
          ],
        ),
        /* NAVBAR: NAVIGATION BUTTONS BETWEEN DASHBOARD, ACCOUNTS, TRANSACTIONS */
        bottomNavigationBar: SizedBox(
          height: 120,
          child: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.attach_money),
                label: 'Accounts',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bar_chart_sharp),
                label: 'Analytics',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: PC_BLUE,
            onTap: _onItemTapped,
            backgroundColor: PC_YELLOW,
            iconSize: 40.0,
          ),
        ));
  }
}
