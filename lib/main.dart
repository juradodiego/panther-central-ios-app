import 'package:flutter/material.dart';
import 'package:panther_central_ios_app/screens/login_screen.dart';


void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Panther Central",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: LoginScreen(),
    );
  }
}
