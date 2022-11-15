import 'package:flutter/material.dart';
import 'package:panther_central_ios_app/screens/load_funds_screen.dart';
import 'package:panther_central_ios_app/screens/accounts_screen.dart';
import 'package:panther_central_ios_app/screens/transactions_screen.dart';
import 'package:panther_central_ios_app/viewModel/users_list_view_model.dart';

import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
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
    const PC_YELLOW = Color.fromARGB(255, 255, 185, 29);
    const PC_BLUE = Color.fromARGB(255, 0, 53, 148);

    // TODO Fix iOS pixel measurements to fit snug

    return Scaffold(
        backgroundColor: PC_BLUE,
        body: PageView(
          controller: pageController,
          children: [
          /* ACCOUNT PAGE */
            SingleChildScrollView(
              child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 300, top: 30.0),
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: Image.asset('asset/images/panther-central-logo.png')
                      ),
                    ),
                  ],
                ),
            ),
          /* DASHBOARD PAGE */
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  /* PC LOGO */
                  Padding(
                      padding: const EdgeInsets.only(right: 300, top: 30.0),
                      child: Center(
                        child: SizedBox(
                            width: 50,
                            height: 50,
                            child: Image.asset(
                                'asset/images/panther-central-logo.png')),
                      )),
                  // TODO Add Settings Gear and Screen Link
                  /* PANTHER FUNDS ACCOUNT */
                  // TODO Display Account Balance
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Container(
                      height: 75,
                      width: 350,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                  /* LOAD FUNDS BUTTON */
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Container(
                      height: 75,
                      width: 350,
                      decoration: BoxDecoration(
                          color: PC_YELLOW,
                          borderRadius: BorderRadius.circular(20)),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => LoadFundsScreen()));
                        },
                        child: const Text(
                          'Load Funds',
                          style: TextStyle(color: PC_BLUE, fontSize: 25),
                        ),
                      ),
                    ),
                  ),
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
                    ),
                  ),
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
                    ),
                  ),
                ],
              ),
            ),
          /*TRANSACTION PAGE*/
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 300, top: 30.0),
                    child: SizedBox(
                        width: 50,
                        height: 50,
                        child: Image.asset('asset/images/panther-central-logo.png')
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        /* NAVBAR */
        bottomNavigationBar: SizedBox(
          height: 100,
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
