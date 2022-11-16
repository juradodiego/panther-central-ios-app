import 'package:flutter/material.dart';
import 'package:panther_central_ios_app/custom_widgets/under_construction_widget.dart';
import 'package:panther_central_ios_app/screens/login_screen.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    // Panther Central Theme Colors
    const PC_YELLOW = Color.fromARGB(255, 255, 185, 29);
    const PC_BLUE = Color.fromARGB(255, 0, 53, 148);

    return Scaffold(
        backgroundColor: PC_BLUE,
        /* APPBAR: BACK OUT BUTTON + PAGE TITLE*/
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
                      const Align(child: Text('SETTINGS', style: TextStyle(color: PC_YELLOW, fontSize: 23,),)),
                      Positioned(
                        left: 10,
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back_ios),
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
        /* BODY: SETTING TOGGLES + LOGOUT BUTTON */
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
          const Center(),
          // TODO Add Setting Toggles
          UnderConstruction(),
          //#region LOGOUT BUTTON
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
          //#endregion
        ])));
  }
}
