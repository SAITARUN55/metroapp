import 'package:flutter/material.dart';
import 'package:metroapp/pages/search_routes_page.dart';
import 'package:metroapp/pages/transport_mode_details_page.dart';

class TransportModesPage extends StatefulWidget {
  TransportModesPage({Key key}) : super(key: key);

  @override
  _TransportModesPageState createState() => _TransportModesPageState();
}

class _TransportModesPageState extends State<TransportModesPage> {
  List<TransportMode> list = [
    TransportMode(title: "Metro", icon: "assets/train.png", page: SearchRoutesPage()),
    TransportMode(title: "Bus", icon: "assets/bus.png", page: SearchRoutesPage()),
    TransportMode(title: "Car", icon: "assets/car.png", page: SearchRoutesPage()),
    TransportMode(title: "Ship", icon: "assets/ship.png", page: SearchRoutesPage()),
    TransportMode(title: "Plane", icon: "assets/plane.png", page: SearchRoutesPage()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transport Modes'),
      ),
      body: Container(
        child: GridView.builder(
          itemCount: list.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              child: Card(
                elevation: 5.0,
                child: Container(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: 40,
                        height: 40,
                        child: Image.asset(list[index].icon),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(list[index].title),
                      )
                    ],
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => TransportModeDetailsPage()));
              },
            );
          },
        ),
      ),
    );
  }
}

class TransportMode {
  String title;
  String icon;
  Widget page;

  TransportMode(
      {@required this.title, @required this.icon, @required this.page});
}
