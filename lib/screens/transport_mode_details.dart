import 'package:flutter/material.dart';
import 'package:metroapp/screens/search_routes.dart';

class TransportModeDetails extends StatefulWidget {
  TransportModeDetails({Key key}) : super(key: key);

  @override
  _TransportModeDetailsState createState() => _TransportModeDetailsState();
}

class _TransportModeDetailsState extends State<TransportModeDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transport Mode Details'),
      ),
      body: Container(
        child: Center(
          child: RaisedButton(
            child: Text('Route finder'),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=> SearchRoutes()));
            }
             ),
           )
         )
       );
  }
}