import 'package:flutter/material.dart';

class PrivacyPolicyFragment extends StatefulWidget {
  @override
  _PrivacyPolicyFragmentState createState() => _PrivacyPolicyFragmentState();
}

class _PrivacyPolicyFragmentState extends State<PrivacyPolicyFragment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text("Privacy Policy"),
        ),
      ),
    );
  }
}
