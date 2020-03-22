import 'package:flutter/material.dart';
import 'package:metroapp/pages/transport_modes_page.dart';

class CitiesPage extends StatefulWidget {
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
  final List<Widget> fragmentIcons = [
    Icon(Icons.info, color: Colors.blue),
    Icon(Icons.navigation, color: Colors.blue),
    Icon(Icons.monetization_on, color: Colors.blue),
    Icon(Icons.map, color: Colors.blue),
    Icon(Icons.settings, color: Colors.blue),
    Icon(Icons.feedback, color: Colors.blue),
    Icon(Icons.share, color: Colors.blue),
    Icon(Icons.rate_review, color: Colors.blue),
    Icon(Icons.security, color: Colors.blue),
    Icon(Icons.exit_to_app, color: Colors.blue),
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
      ),),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (_) => TransportModesPage()));
        }
      
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
                      leading: fragmentIcons[index],
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
