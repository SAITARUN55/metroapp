import 'package:flutter/material.dart';
import 'package:metroapp/screens/transport_mode_details.dart';

class TransportModes extends StatefulWidget {
  TransportModes({Key key}) : super(key: key);

  @override
  _TransportModesState createState() => _TransportModesState();
}

class _TransportModesState extends State<TransportModes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transport Modes'),
      ),
      body: Container(
        child: Center(
          child: RaisedButton(
            child: Text('Details Screen'),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=> TransportModeDetails()));
            }
             ),
           )
         )
       );
  }
}