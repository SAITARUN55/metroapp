import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(
  MaterialApp(home:GridLayout())
);

class GridLayout extends StatelessWidget{

  List<String> events = [
    "Hyderabad",
    "Delhi",
    "Bangalore",
    "Mumbai",
    "Chennai",
    "Kolkata"
  ];
  @override
  Widget build(BuildContext context) {
    // Create empty app with background
    return Scaffold(body: Container(decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage("assets/bg.jpg"),fit: BoxFit.cover),),child: Container(
      margin: const EdgeInsets.only(top: 120.0),
      child: GridView(
        physics: BouncingScrollPhysics(), // Only for iOS
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), // 2 item per row
        children: events.map((title){
          //Loop all item in events list
          return GestureDetector(
            child: ,
            onTap: () {
            //Show Toast
            Fluttertoast.showToast(
                msg:title + " click",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0
            );
          },);
        }).toList(),
      ),
    ),));
  }
}


