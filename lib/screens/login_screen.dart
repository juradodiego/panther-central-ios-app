import 'package:flutter/material.dart';


import 'package:panther_central_ios_app/screens/home_screen.dart';
import 'package:panther_central_ios_app/viewModel/user_view_model.dart';
import 'package:panther_central_ios_app/viewModel/users_list_view_model.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  //#region INPUT CONTROLLERS
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  //#endregion
  @override
  Widget build(BuildContext context) {
    // Panther Central Theme Colors
    const Color PC_YELLOW = Color.fromARGB(255, 255, 185, 29);
    const Color PC_BLUE = Color.fromARGB(255, 0, 53, 148);

    return Scaffold(
      backgroundColor: PC_BLUE,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            //#region PANTHER CENTRAL LOGO
            Padding(
                padding: const EdgeInsets.only(top: 40.0, bottom: 30),
                child: Center(
                  child: SizedBox(
                      width: 200,
                      height: 150,
                      child:
                          Image.asset('assets/images/panther-central-logo.png')),
                )),
            //#endregion
            //#region USERNAME INPUT
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: usernameController,
                decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Username',
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                    hintText: 'Enter a valid username ex. abc@gmail.com'),
              ),
            ),
            //#endregion
            //#region PASSWORD INPUT
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                    hintText: 'Enter a secure password'),
              ),
            ),
            //#endregion
            //#region FORGOT PASSWORD BUTTON
            TextButton(
              onPressed: () {
                // TODO FORGOT PASSWORD SCREEN GOES HERE
              },
              child: const Text(
                'Forgot Password',
                style: TextStyle(color: PC_YELLOW, fontSize: 15),
              ),
            ),
            //#endregion
            //#region LOGIN AUTHORIZATION BUTTON
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: PC_YELLOW, borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                  onPressed: () {
                    authorizeLogin(
                        usernameController.text, passwordController.text);
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(color: PC_BLUE, fontSize: 25),
                  ),
                ),
              ),
            ),
            //#endregion
            //#region SPACER
            const SizedBox(
              height: 130,
            ),
            //#endregion
            //#region CREATE ACCOUNT BUTTON
            const Text('New User? Create Account')
            //#endregion
          ],
        ),
      ),
    );
  }

  void authorizeLogin(String username, String password) {
    UsersListViewModel ULVM = UsersListViewModel(); // Initialize UserListViewModel
    UserViewModel? user = ULVM.fetchUser(username); // Get Specific User Info
    // TODO Add Password Authentication
    // if user exists, then login; otherwise, display login error
    if (user != null) {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => HomeScreen(user)));
    } else {
      // TODO Add Login Failed Popup
    }
  }
}
