import 'package:flutter/material.dart';
import 'package:panther_central_ios_app/screens/select_amount_screen.dart';

class LoadFundsScreen extends StatefulWidget {
  @override
  _LoadFundsScreenState createState() => _LoadFundsScreenState();
}

class _LoadFundsScreenState extends State<LoadFundsScreen> {
  List<String> items = <String>[r'$5.00', r'$10.00', r'$25.00', r'$50.00'];
  String? selectedItem = r'$5.00';

  @override
  Widget build(BuildContext context) {
    const PC_YELLOW = Color.fromARGB(255, 255, 185, 29);
    const PC_BLUE = Color.fromARGB(255, 0, 53, 148);

    return Scaffold(
      backgroundColor: PC_BLUE,
      /* GO BACK ICON BUTTON */
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(100), // Set this height
          child: Container(
              color: PC_BLUE,
              child: Row(children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 30.0),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios_new),
                    iconSize: 40,
                    color: PC_YELLOW,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ]))),
      body: Center(
        child: Column(
          children: <Widget>[
            /* Select Payment Method */
            // Padding(
            //   padding: const EdgeInsets.only(top: 15),
            //   child: Container(
            //     height: 75,
            //     width: 350,
            //     decoration: BoxDecoration(
            //         color: PC_YELLOW, borderRadius: BorderRadius.circular(20)),
            //     child: ElevatedButton(
            //         onPressed: () {
            //           Navigator.push(
            //               context,
            //               MaterialPageRoute(
            //                   builder: (_) => SelectAmountScreen()));
            //         },
            //         child: Row(
            //           children: [
            //             Text("Select Payment Method"),
            //             SizedBox(
            //               width: 100,
            //             ),
            //             Icon(
            //               Icons.arrow_forward_ios,
            //               size: 24,
            //             ),
            //           ],
            //         )),
            //   ),
            // ),
            /*Select Amount */
            Container(
              width: 350,
              height: 75,
              color: Colors.white,
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedItem,
                  items: items
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(item,
                                    style: TextStyle(fontSize: 24)
                                )
                            ),
                          ))
                      .toList(),
                  onChanged: (item) => setState(() => selectedItem = item),
                  icon: Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Icon(Icons.arrow_drop_down)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
