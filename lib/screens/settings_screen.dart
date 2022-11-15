import 'package:flutter/material.dart';
import 'package:panther_central_ios_app/screens/login_screen.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen>{
  @override
  Widget build(BuildContext context){
    const PC_YELLOW = Color.fromARGB(255, 255, 185, 29);
    const PC_BLUE = Color.fromARGB(255, 0, 53, 148);
    
    return Scaffold(
        backgroundColor: PC_BLUE,
        body: SingleChildScrollView(
        child: Column(
        children: <Widget>[
          /* X ICON */
          // TODO Add Icon; Add Screen Link;
          const Padding(
              padding: EdgeInsets.only(right: 300, top: 30.0),
              child: Center(
                child: SizedBox(
                    width: 50,
                    height: 50,
                    // child: ,
                ),
              )
            ),
          // TODO Add Setting Toggles
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
          ]
        )
      )
    );
  }
}