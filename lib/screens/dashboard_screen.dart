import 'package:flutter/material.dart';
import 'package:panther_central_ios_app/screens/load_funds_screen.dart';
import 'package:panther_central_ios_app/screens/settings_screen.dart';
import 'package:panther_central_ios_app/viewModel/user_view_model.dart';
import 'package:panther_central_ios_app/viewModel/users_list_view_model.dart';

import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  final UserViewModel? user;

  const DashboardScreen(this.user);

  @override
  _DashboardScreenState createState() {
    return _DashboardScreenState();
  }
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 1;

  PageController pageController = PageController(initialPage: 1);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    pageController.jumpToPage(_selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    const Color PC_YELLOW = Color.fromARGB(255, 255, 185, 29);
    const Color PC_BLUE = Color.fromARGB(255, 0, 53, 148);
    final UserViewModel? user = widget.user;

    // TODO Fix iOS pixel measurements to fit snug

    return Scaffold(
        backgroundColor: PC_BLUE,
        /* APPBAR: PC LOGO + SETTINGS BUTTON */
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100), // Set this height
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Container(
              color: PC_BLUE,
              child: Row(
                children: <Widget>[
                  /* PC LOGO */
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: SizedBox(
                        width: 75,
                        height: 75,
                        child: Image.asset(
                            'assets/images/panther-central-logo.png')),
                  ),
                  const Spacer(),
                  /* SETTINGS BUTTON */
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
                ],
              ),
            ),
          ),
        ),
        body: PageView(
          controller: pageController,
          children: [
            //#region ACCOUNTS SCREEN
            SingleChildScrollView(
              child: Column(
                children: const <Widget>[
                  Icon(
                    Icons.warning_rounded,
                    size: 75,
                    color: PC_YELLOW,
                  ),
                  Text(
                    "Under Construction",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: PC_YELLOW),
                  ),
                ],
              ),
            ),
            //#endregion
            //#region DASHBOARD SCREEN
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  /* PANTHER FUNDS ACCOUNT */
                  Text("Panther Funds"),
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
                          r'$' + user!.accounts["Panther Funds"].toString(),
                          style: const TextStyle(fontSize: 25),
                        ),
                      ),
                    ),
                  ),

                  /* LOAD FUNDS BUTTON */
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
                                style: TextStyle(color: Colors.white, fontSize: 20),
                              ),
                              Spacer(),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 25,
                              )
                            ],
                          )),
                    ),
                  ),
                  Text("Dining Dollars"),
                  /* DD ACCOUNT */
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
                          r'$' + user!.accounts["Dining Dollars"].toString(),
                          style: const TextStyle(fontSize: 25),
                        ),
                      ),
                    ),
                  ),
                  Text("Off- Campus Dining Dollars"),
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
                          style: const TextStyle(fontSize: 25),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //#endregion
            //#region TRANSACTIONS SCREEN
            SingleChildScrollView(
              child: Column(
                children: const <Widget>[
                  Icon(
                    Icons.warning_rounded,
                    size: 75,
                    color: PC_YELLOW,
                  ),
                  Text(
                    "Under Construction",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: PC_YELLOW),
                  ),
                ],
              ),
            )
            //#endregion
          ],
        ),

        /* NAVBAR */
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
