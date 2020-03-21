import 'package:flutter/material.dart';

class LogoutFragment extends StatefulWidget {
  @override
  _LogoutFragmentState createState() => _LogoutFragmentState();
}

class _LogoutFragmentState extends State<LogoutFragment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text("Logout"),
        ),
      ),
    );
  }
}
