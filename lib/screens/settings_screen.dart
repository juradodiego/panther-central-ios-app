import 'package:flutter/material.dart';
import 'package:panther_central_ios_app/screens/login_screen.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    const PC_YELLOW = Color.fromARGB(255, 255, 185, 29);
    const PC_BLUE = Color.fromARGB(255, 0, 53, 148);

    return Scaffold(
        backgroundColor: PC_BLUE,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(100), // Set this height
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
              const Align(child: Text('SETTINGS')),
          Positioned(
            left: 10,
            child: IconButton(
              icon: const Icon(Icons.arrow_forward_ios),
              iconSize: 40,
              color: PC_YELLOW,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          ],
        ),
    ),
              ),
            )),
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
          // TODO Add Setting Toggles
          /* PC LOGO */
          Padding(
              padding: const EdgeInsets.only(top: 30.0, bottom: 30),
              child: Center(
                child: SizedBox(
                    width: 200,
                    height: 150,
                    child:
                        Image.asset('assets/images/panther-central-logo.png')),
              )),
          /* LOGOUT BUTTON */
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: PC_YELLOW, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => LoginScreen()));
                },
                child: const Text(
                  'Logout',
                  style: TextStyle(color: PC_BLUE, fontSize: 25),
                ),
              ),
            ),
          ),
        ])));
  }
}
