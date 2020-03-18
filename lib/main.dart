import 'package:flutter/material.dart';


void main() {
  runApp(new MaterialApp(
    title: "Metro App",
    home: new Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<Container> Places = new List();

  var karakter=[
    {"nama":"Bangalore", "gambar":"blr.jpg"},
    {"nama":"Chennai", "gambar":"chennai.jpg"},
    {"nama":"Delhi", "gambar":"delhi.jpg"},
    {"nama":"Hyderabad", "gambar":"hyd.jpg"},
    {"nama":"Kolkata", "gambar":"kolkata.jpg"},
    {"nama":"Mumbai", "gambar":"mumbai.jpg"},
  ];

  _buatlist()async {
    for (var i=0; i < karakter.length; i++) {
      final karakternya = karakter[i];
      final String gambar = karakternya["gambar"];
      Places.add(
        new Container(
          child: new Card( child:
            new Column(
              children: <Widget>[
                new Image.asset("assets/$gambar", fit: BoxFit.cover,),
                new Text(karakternya["nama"], style: new TextStyle(fontSize: 18.0),)
              ],
            )
          )
        )
      );
    }
  }

  @override
  void initState() {
    _buatlist();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Metro App",style: new TextStyle(color: Colors.white),),

      ),
      body: new GridView.count(
          crossAxisCount: 2,
          children: Places,
      ),
    );
  }
}



