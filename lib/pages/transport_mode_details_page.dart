import 'package:flutter/material.dart';
import 'package:metroapp/pages/plan_journey_page.dart';
import 'package:metroapp/pages/search_routes_page.dart';

class TransportModeDetailsPage extends StatefulWidget {
  TransportModeDetailsPage({Key key}) : super(key: key);

  @override
  _TransportModeDetailsPageState createState() =>
      _TransportModeDetailsPageState();
}

class _TransportModeDetailsPageState extends State<TransportModeDetailsPage> {
  List<TransportModeDetailsOption> tmdetails = [
    TransportModeDetailsOption(
      name: "Routes",
      icon: Icons.search,
      page: SearchRoutesPage(),
    ),
    TransportModeDetailsOption(
      name: "Journey Planner",
      icon: Icons.timeline,
      page: PlanJourneyPage(),
    ),
    TransportModeDetailsOption(
      name: "Metro Map",
      icon: Icons.map,
      page: SearchRoutesPage(),
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
