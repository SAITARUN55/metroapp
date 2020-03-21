import 'package:flutter/material.dart';
import 'package:metroapp/fragments/about_frag.dart';
import 'package:metroapp/fragments/fare_frag.dart';
import 'package:metroapp/fragments/logout_frag.dart';
import 'package:metroapp/fragments/metro_map_frag.dart';
import 'package:metroapp/fragments/privacy_policy_frag.dart';
import 'package:metroapp/fragments/rate_app_frag.dart';
import 'package:metroapp/fragments/routes_frag.dart';
import 'package:metroapp/fragments/settings_frag.dart';

void main() {
  runApp(new MaterialApp(
    title: "Metro App",
    home: new Home(),
    routes: {
      '/about': (context) => AboutFragment(),
      '/routes': (context) => RoutesFragment(),
      '/fare': (context) => FareFragment(),
      '/metroMap': (context) => MetroMapFragment(),
      '/settings': (context) => SettingsFragment(),
      '/rateTheApp': (context) => RateAppFragment(),
      '/privacyPolicy': (context) => PrivacyPolicyFragment(),
      '/Logout': (context) => LogoutFragment(),
    },
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Container> Places = new List();

  var karakter = [
    {"nama": "Bangalore", "gambar": "blr.jpg"},
    {"nama": "Chennai", "gambar": "chennai.jpg"},
    {"nama": "Delhi", "gambar": "delhi.jpg"},
    {"nama": "Hyderabad", "gambar": "hyd.jpg"},
    {"nama": "Kolkata", "gambar": "kolkata.jpg"},
    {"nama": "Mumbai", "gambar": "mumbai.jpg"},
  ];

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

  _buatlist() async {
    for (var i = 0; i < karakter.length; i++) {
      final karakternya = karakter[i];
      final String gambar = karakternya["gambar"];
      Places.add(new Container(
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
      ))));
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Metro App',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 28),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListView.builder(
              itemCount: fragmentTitles.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return Column(
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        '${fragmentTitles[index]}',
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                        Navigator.pushNamed(
                            context, '/${fragmentRoutes[index]}');
                      },
                    ),
                    Divider(
                      height: 1,
                      thickness: 1,
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
      body: new GridView.count(
        crossAxisCount: 2,
        children: Places,
      ),
    );
  }
}
