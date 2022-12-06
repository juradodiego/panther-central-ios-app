import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:panther_central_ios_app/screens/login_screen.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:panther_central_ios_app/viewModel/user_view_model.dart';

class SettingsScreen extends StatefulWidget {
  final UserViewModel? user;

  const SettingsScreen(this.user);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    // Panther Central Theme Colors
    const PC_YELLOW = Color.fromARGB(255, 255, 185, 29);
    const PC_BLUE = Color.fromARGB(255, 0, 53, 148);

    bool _test = false;

    return Scaffold(
        backgroundColor: PC_BLUE,
        /* APPBAR: BACK OUT BUTTON + PAGE TITLE*/
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100), // Set this height
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
                      const Align(
                          child: Text(
                        'SETTINGS',
                        style: TextStyle(
                          color: PC_YELLOW,
                          fontSize: 23,
                        ),
                      )),
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
          child: Column(
            children: <Widget>[
              CupertinoSwitch(
                  
                  value: _test,
                  onChanged: (value) => setState(() {
                        _test = value;
                      })),
              //const Center(),
              SettingsList(
                shrinkWrap: true,
                sections: [
                  SettingsSection(
                    title: const Text("Settings"),
                    tiles: <SettingsTile>[
                      SettingsTile.switchTile(
                        title: const Text('Notifications'),
                        initialValue: false,
                        onToggle: (bool value) {},
                      ),
                      SettingsTile.switchTile(
                        title: const Text('Alert Purchases'),
                        initialValue: false,
                        onToggle: (bool value) {},
                      ),
                    ],
                  ),
                ],
              ),

              //#region LOGOUT BUTTON
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      color: PC_YELLOW,
                      borderRadius: BorderRadius.circular(20)),
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
            ],
          ),
        ));
  }
}
