import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:panther_central_ios_app/screens/login_screen.dart';
import 'package:panther_central_ios_app/viewModel/user_view_model.dart';

class SettingsScreen extends StatefulWidget {
  final UserViewModel? user;

  const SettingsScreen(this.user);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool notification = false;
  bool alertPurchases = false;
  bool allowParent = false;
  bool showParentDialog = false;
  String email = '';

  // Extra functionalities for the Allow Parent button, as we want a popup
  // textbox for user to input an email
  String onChangeParent(bool? value) {
    setState(() {
      allowParent = value!;
    });
    if (value!) {
      openDialog();
      () async {
        final email = await openDialog();
        return email;
      };

      // final email = await openDialog();
      // return email;
    }
    return '';
  }

  // controller for grabbing and displaying input email
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<String?> openDialog() => showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
            title: Text("Parent Email"),
            content: TextField(
              autofocus: true,
              decoration: InputDecoration(hintText: "Enter your parent email"),
              controller: controller,
            ),
            actions: [
              TextButton(
                child: Text("Submit"),
                onPressed: () {
                  Navigator.of(context).pop(controller.text);
                },
              )
            ],
          ));

  @override
  Widget build(BuildContext context) {
    // Panther Central Theme Colors
    const PC_YELLOW = Color.fromARGB(255, 255, 185, 29);
    const PC_BLUE = Color.fromARGB(255, 0, 53, 148);

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
        body: Column(
          children: <Widget>[
            //#region little padding ahead
            const Padding(
              padding: EdgeInsets.all(10.0),
            ),
            //#endregion

            //#region Notification Switch
            Container(
              color: CupertinoTheme.of(context).barBackgroundColor,
              child: CupertinoFormRow(
                prefix: Row(
                  children: const <Widget>[
                    SizedBox(width: 10),
                    Text('Notifications')
                  ],
                ),
                child: CupertinoSwitch(
                  // This bool value toggles the switch.
                  value: notification,
                  thumbColor: CupertinoColors.systemBlue,
                  trackColor: PC_YELLOW.withOpacity(0.2),
                  activeColor: PC_YELLOW,
                  onChanged: (bool? value) {
                    // This is called when the user toggles the switch.
                    setState(() {
                      notification = value!;
                    });
                  },
                ),
              ),
            ),
            //#endregion

            //#region Alert Purchases Switch
            Container(
              color: CupertinoTheme.of(context).barBackgroundColor,
              child: CupertinoFormRow(
                prefix: Row(
                  children: const <Widget>[
                    SizedBox(width: 10),
                    Text('Alert Purchases')
                  ],
                ),
                child: CupertinoSwitch(
                  // This bool value toggles the switch.
                  value: alertPurchases,
                  thumbColor: CupertinoColors.systemBlue,
                  trackColor: PC_YELLOW.withOpacity(0.2),
                  activeColor: PC_YELLOW,
                  onChanged: (bool? value) {
                    // This is called when the user toggles the switch.
                    setState(() {
                      alertPurchases = value!;
                    });
                  },
                ),
              ),
            ),
            //#endregion

            //#region Allow Parent Switch
            Container(
              color: CupertinoTheme.of(context).barBackgroundColor,
              child: CupertinoFormRow(
                prefix: Row(
                  children: const <Widget>[
                    SizedBox(width: 10),
                    Text('Allow Parent')
                  ],
                ),
                child: CupertinoSwitch(
                  // This bool value toggles the switch.
                  value: allowParent,
                  thumbColor: CupertinoColors.systemBlue,
                  trackColor: PC_YELLOW.withOpacity(0.2),
                  activeColor: PC_YELLOW,
                  onChanged: (value) {
                    final email = onChangeParent(value);

                    setState(() {
                      this.email = email;
                    });
                  },
                ),
              ),
            ),
            //#endregion

            const Padding(
              padding: EdgeInsets.all(10.0),
            ),

            Row(
              children: [
                Text(
                  email,
                  style: const TextStyle(color: PC_YELLOW),
                )
              ],
            ),

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
          ],
        ));
  }
}
