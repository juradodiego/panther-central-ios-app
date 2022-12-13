import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:panther_central_ios_app/screens/choose_payment_screen.dart';
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
  onChangeParent(bool? value) {
    setState(() {
      allowParent = value!;
    });
    if (value!) {
      //if (email == '') {
      displayEmail();
      //}
    }
  }

  // a helper function of onChangeParent to display the parent email
  void displayEmail() async {
    final inputemail = await openDialog();
    if (inputemail == null) {
      onChangeParent(false);
      return;
    }
    setState(() {
      email = inputemail;
    });
  }

  // controller for grabbing and displaying input email
  late TextEditingController controller;
  // change the parent email by directly doing modifications in the textfield
  //late TextEditingController changeEmailController;

  @override
  void initState() {
    super.initState();
    //changeEmailController = TextEditingController();
    controller = TextEditingController();
    //changeEmailController.text = email;
  }

  @override
  void dispose() {
    controller.dispose();
    //changeEmailController.dispose();
    super.dispose();
  }

  Future<String?> openDialog() => showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
            title: const Text("Parent Email"),
            content: TextField(
              autofocus: true,
              decoration:
                  const InputDecoration(hintText: "Enter your parent email"),
              controller: controller,
            ),
            actions: [
              TextButton(
                child: const Text("Cancel"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text("Submit"),
                onPressed: () {
                  if (controller.text != '') {
                    Navigator.of(context).pop(controller.text);
                  } else {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: const Text("Alert"),
                              content: const Text("Input cannot be empty!"),
                              actions: <Widget>[
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text("OK"))
                              ],
                            ));
                  }
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
                prefix: const PrefixWidget(
                  icon: CupertinoIcons.bell,
                  title: 'Notifications',
                  color: CupertinoColors.systemRed,
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
                prefix: const PrefixWidget(
                  icon: CupertinoIcons.money_dollar_circle,
                  title: 'Alert Purchases',
                  color: Color.fromARGB(255, 78, 202, 124),
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
                prefix: const PrefixWidget(
                  icon: CupertinoIcons.lock,
                  title: 'Allow Parent',
                  color: Color.fromARGB(255, 241, 128, 63),
                ),
                child: CupertinoSwitch(
                  // This bool value toggles the switch.
                  value: allowParent,
                  thumbColor: CupertinoColors.systemBlue,
                  trackColor: PC_YELLOW.withOpacity(0.2),
                  activeColor: PC_YELLOW,
                  onChanged: onChangeParent,
                ),
              ),
            ),
            //#endregion

            Container(
              color: CupertinoTheme.of(context).barBackgroundColor,
              child: CupertinoFormRow(
                prefix: const PrefixWidget(
                  icon: CupertinoIcons.envelope,
                  title: 'Parent Email',
                  color: CupertinoColors.systemBlue,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      //controller: changeEmailController,
                      email,
                      style: const TextStyle(fontSize: 16.5),
                    ),
                  ],
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.all(10.0),
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

class PrefixWidget extends StatelessWidget {
  const PrefixWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.color,
  });

  final IconData icon;
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Icon(icon, color: CupertinoColors.white),
        ),
        const SizedBox(width: 10),
        Text(title)
      ],
    );
  }
}
