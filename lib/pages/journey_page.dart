import 'package:flutter/material.dart';

class JourneyPage extends StatefulWidget {
  JourneyPage({Key key}) : super(key: key);

  @override
  _JourneyPageState createState() => _JourneyPageState();
}

class _JourneyPageState extends State<JourneyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('Journey Page'),
       ),
       body: Container(),
    );
  }
}