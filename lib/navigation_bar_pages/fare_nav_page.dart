import 'package:flutter/material.dart';

class FareFragment extends StatefulWidget {
  @override
  _FareFragmentState createState() => _FareFragmentState();
}

class _FareFragmentState extends State<FareFragment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text("Fare"),
        ),
      ),
    );
  }
}
