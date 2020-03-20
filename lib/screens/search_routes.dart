import 'package:flutter/material.dart';

class SearchRoutes extends StatefulWidget {
  SearchRoutes({Key key}) : super(key: key);

  @override
  _SearchRoutesState createState() => _SearchRoutesState();
}

class _SearchRoutesState extends State<SearchRoutes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Routes'),
      ),
      body: Container(
        child: Center(
          child: RaisedButton(
            child: Text('From and To stations'),
            onPressed: (){
              //Navigator.push(context, MaterialPageRoute(builder: (_)=> TransportModeDetails()));
            }
             ),
           )
         )
       );
  }
}