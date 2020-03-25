import 'package:flutter/material.dart';

class MetroMapFragment extends StatefulWidget {
  @override
  _MetroMapFragmentState createState() => _MetroMapFragmentState();
}

class _MetroMapFragmentState extends State<MetroMapFragment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text("Metro Map"),
        ),
      ),
    );
  }
}
