import 'package:flutter/material.dart';

class AboutFragment extends StatefulWidget {
  @override
  _AboutFragmentState createState() => _AboutFragmentState();
}

class _AboutFragmentState extends State<AboutFragment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text("About"),
        ),
      ),
    );
  }
}
