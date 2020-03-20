import 'package:flutter/material.dart';
import 'package:metroapp/screens/search_routes.dart';

class TransportModeDetails extends StatefulWidget {
  TransportModeDetails({Key key}) : super(key: key);

  @override
  _TransportModeDetailsState createState() => _TransportModeDetailsState();
}

class _TransportModeDetailsState extends State<TransportModeDetails> {
  List<TransportModeDetailsOption> tmdetails = [
    TransportModeDetailsOption(
      name: "Routes",
      icon: Icons.map,
      page: SearchRoutes(),
    ),
    TransportModeDetailsOption(
      name: "Fare Calculator",
      icon: Icons.map,
      page: SearchRoutes(),
    ),
    TransportModeDetailsOption(
      name: "Journey Planner",
      icon: Icons.map,
      page: SearchRoutes(),
    ),
    TransportModeDetailsOption(
      name: "Metro Map",
      icon: Icons.map,
      page: SearchRoutes(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transport Mode Details'),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: tmdetails.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Icon(tmdetails[index].icon),
              title: Text(tmdetails[index].name),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => tmdetails[index].page),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class TransportModeDetailsOption {
  final String name;
  final IconData icon;
  final Widget page;

  TransportModeDetailsOption(
      {@required this.name, @required this.icon, @required this.page});
}
