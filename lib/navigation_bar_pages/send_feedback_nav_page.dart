import 'package:flutter/material.dart';

class SendFeedbackFragment extends StatefulWidget {
  @override
  _SendFeedbackFragmentState createState() => _SendFeedbackFragmentState();
}

class _SendFeedbackFragmentState extends State<SendFeedbackFragment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text("Send Feedback"),
        ),
      ),
    );
  }
}
