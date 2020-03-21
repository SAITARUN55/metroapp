import 'package:flutter/material.dart';

class PlanJourneyPage extends StatefulWidget {
  PlanJourneyPage({Key key}) : super(key: key);

  @override
  _PlanJourneyPageState createState() => _PlanJourneyPageState();
}

class _PlanJourneyPageState extends State<PlanJourneyPage> {

  TextEditingController fromStationController = new TextEditingController();
  TextEditingController toStationController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Journey Planner'),
      ),
      body: Container(
        padding: EdgeInsets.all(5),
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Icon(
                Icons.radio_button_checked,
                size: 30,
                color: Colors.red,
              ),
              title: Text(
                'From',
                style: TextStyle(color: Colors.grey),
              ),
              subtitle: TextFormField(
                controller: fromStationController,
                style: TextStyle(color: Colors.black, fontSize: 20),
                maxLines: 1,
                decoration: InputDecoration(
                  hintText: "Source location",
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: IconButton(
                  icon: Icon(
                    Icons.swap_vertical_circle,
                    size: 50,
                    color: Colors.grey.shade600,
                  ),
                  onPressed: () {
                    setState(() {});
                  }),
            ),
            ListTile(
              leading: Icon(Icons.location_on, size: 30, color: Colors.red),
              title: Text('To', style: TextStyle(color: Colors.grey)),
              subtitle: TextFormField(
                controller: toStationController,
                style: TextStyle(color: Colors.black, fontSize: 20),
                maxLines: 1,
                decoration: InputDecoration(
                  hintText: "Destination location",
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ],
        ),
      ));
  }
}
