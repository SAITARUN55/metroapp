import 'package:flutter/material.dart';
import 'package:metroapp/widgets/app_drawer.dart';

import 'transport_modes_page.dart';

class CitiesPage extends StatefulWidget {
  final fragmentTitles = [
    "About",
    "Routes",
    "Fare",
    "Metro Map",
    "Settings",
    "Send Feedback",
    "Share",
    "Rate the app",
    "Privacy Policy",
    "Logout"
  ];

  final fragmentRoutes = [
    "about",
    "routes",
    "fare",
    "metroMap",
    "settings",
    "sendFeedback",
    "share",
    "rateTheApp",
    "privacyPolicy",
    "Logout"
  ];

  @override
  _CitiesPageState createState() => _CitiesPageState();
}

class _CitiesPageState extends State<CitiesPage> {
  List<Container> Places = new List();

  var karakter = [
    {"nama": "Bangalore", "gambar": "blr.jpg"},
    {"nama": "Chennai", "gambar": "chennai.jpg"},
    {"nama": "Delhi", "gambar": "delhi.jpg"},
    {"nama": "Hyderabad", "gambar": "hyd.jpg"},
    {"nama": "Kolkata", "gambar": "kolkata.jpg"},
    {"nama": "Mumbai", "gambar": "mumbai.jpg"},
  ];

  _buatlist() async {
    for (var i = 0; i < karakter.length; i++) {
      final karakternya = karakter[i];
      final String gambar = karakternya["gambar"];
      Places.add(new Container(
          child: GestureDetector(
        child: new Card(
            child: new Column(
          children: <Widget>[
            new Image.asset(
              "assets/$gambar",
              fit: BoxFit.cover,
            ),
            new Text(
              karakternya["nama"],
              style: new TextStyle(fontSize: 18.0),
            )
          ],
        )),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => TransportModesPage()));
        },
      )));
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
        title: new Text(
          "Metro App",
          style: new TextStyle(color: Colors.white),
        ),
      ),
      drawer: AppDrawer(
        fragmentTitles: widget.fragmentTitles,
        fragmentRoutes: widget.fragmentRoutes,
      ),
      body: new GridView.count(
        crossAxisCount: 2,
        children: Places,
      ),
    );
  }
}
