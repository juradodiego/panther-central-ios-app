import 'package:flutter/material.dart';
import 'package:panther_central_ios_app/main.dart';
import 'package:panther_central_ios_app/screens/dashboard_screen.dart';
import 'package:panther_central_ios_app/viewModel/user_view_model.dart';
import 'package:panther_central_ios_app/viewModel/users_list_view_model.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const PC_YELLOW = Color.fromARGB(255, 255, 185, 29);
    const PC_BLUE = Color.fromARGB(255, 0, 53, 148);

    return Scaffold(
      backgroundColor: PC_BLUE,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            /* PC LOGO */
            Padding(
                padding: const EdgeInsets.only(top: 30.0, bottom: 30),
                child: Center(
                  child: SizedBox(
                      width: 200,
                      height: 150,
                      child:
                          Image.asset('asset/images/panther-central-logo.png')),
                )),
            /* USERNAME INPUT */
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
            /* PASSWORD INPUT */
            Padding(
              padding:
                  const EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
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
            /* FORGOT PASSWORD BUTTON */
            TextButton(
              onPressed: () {
                // TODO FORGOT PASSWORD SCREEN GOES HERE
              },
              child: const Text(
                'Forgot Password',
                style: TextStyle(color: PC_YELLOW, fontSize: 15),
              ),
            ),
            /* LOGIN BUTTON */
            Padding(
              padding:  const EdgeInsets.only(top: 30),
              child: Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: PC_YELLOW, borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                  onPressed: () async {
                    await showDialog<void>(
                        context: context,
                        builder: (BuildContext context) {
                          authorizeLogin(usernameController.text, passwordController.text);
                          return  AlertDialog(
                            content: const Text(
                                'Invalid Login Attempt, Try Again'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          );
                        }
                    );
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(color: PC_BLUE, fontSize: 25),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 130,
            ),
            const Text('New User? Create Account')
          ],
        ),
      ),
    );
  }

  void authorizeLogin(String username, String password) {
    UsersListViewModel ULVM = UsersListViewModel();
    UserViewModel? user = ULVM.fetchUser(username);

    // TODO Add Password Authentication
    if (user != null) {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => DashboardScreen(user)));
    }
    // Move to Dashboard Page
  }
}
