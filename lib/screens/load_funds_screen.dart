import 'package:flutter/material.dart';

class LoadFundsScreen extends StatefulWidget {
  @override
  _LoadFundsScreenState createState() => _LoadFundsScreenState();
}

class _LoadFundsScreenState extends State<LoadFundsScreen> {
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
                      width: 150,
                      height: 150,
                      child:
                          Image.asset('asset/images/panther-central-logo.png')),
                )),
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
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Go back',
                    style: TextStyle(color: PC_BLUE, fontSize: 25),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
