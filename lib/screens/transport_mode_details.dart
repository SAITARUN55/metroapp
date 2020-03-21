import 'package:flutter/material.dart';
import 'package:metroapp/screens/plan_journey_page.dart';
import 'package:metroapp/screens/search_routes.dart';
import 'package:metroapp/screens/metro_map_page.dart';

class TransportModeDetails extends StatefulWidget {
  TransportModeDetails({Key key}) : super(key: key);

  @override
  _TransportModeDetailsState createState() => _TransportModeDetailsState();
}

class _TransportModeDetailsState extends State<TransportModeDetails> {
  List<TransportModeDetailsOption> tmdetails = [
    TransportModeDetailsOption(
      name: "Find Routes",
      icon: Icons.search,
      page: SearchRoutes(),
    ),
    TransportModeDetailsOption(
      name: "Journey Planner",
      icon: Icons.timeline,
      page: PlanJourneyPage(),
    ),
    // TransportModeDetailsOption(
    //   name: "Fare Calculator",
    //   icon: Icons.attach_money,
    //   page: SearchRoutes(),
    // ),
    TransportModeDetailsOption(
      name: "Metro Map",
      icon: Icons.map,
      page: MetroMapPage(),
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
            return Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(
                    tmdetails[index].icon,
                    ),
                  title: Text(
                    tmdetails[index].name,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  trailing: Icon(
                    Icons.chevron_right,
                    ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => tmdetails[index].page),
                    );
                  },
                ),
                Divider(
                  height: 15,
                  color: Colors.grey.shade800,
                ),
              ],
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
