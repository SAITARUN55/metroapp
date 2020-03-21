import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 5,
      backgroundColor: Colors.white,
      image: Image.asset('assets/ic_launcher-playstore.png'),
      photoSize: 150.0,
      navigateAfterSeconds: new HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
