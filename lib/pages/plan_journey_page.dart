import 'package:flutter/material.dart';
import 'package:metroapp/pages/journey_page.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:metroapp/models/station.dart';

class PlanJourneyPage extends StatefulWidget {
  PlanJourneyPage({Key key}) : super(key: key);

  @override
  _PlanJourneyPageState createState() => _PlanJourneyPageState();
}

class _PlanJourneyPageState extends State<PlanJourneyPage> {
  GlobalKey<AutoCompleteTextFieldState<Station>> sourceKey = new GlobalKey();
  GlobalKey<AutoCompleteTextFieldState<Station>> destinationKey =
      new GlobalKey();

  TextEditingController fromStationController = new TextEditingController();
  TextEditingController toStationController = new TextEditingController();
  TextEditingController temporaryController = new TextEditingController();

  List<Station> stationList = [
    Station(id: 1, name: 'Nagole'),
    Station(id: 2, name: 'Uppal'),
    Station(id: 3, name: 'Stadium'),
    Station(id: 4, name: 'NGRI'),
    Station(id: 5, name: 'Habsiguda'),
    Station(id: 6, name: 'Tarnaka'),
    Station(id: 7, name: 'Mettuguda'),
    Station(id: 8, name: 'Sec-East'),
    Station(id: 9, name: 'Parade Ground'),
    Station(id: 10, name: 'Paradise'),
    Station(id: 11, name: 'Rasoolpura'),
    Station(id: 12, name: 'Prakash Nagar'),
    Station(id: 13, name: 'Begumpet'),
    Station(id: 14, name: 'Ameerpet'),
    Station(id: 15, name: 'Madhura Nagar'),
    Station(id: 16, name: 'Yusufguda'),
    Station(id: 17, name: 'Jubilee Road No. 5'),
    Station(id: 18, name: 'JCP'),
    Station(id: 19, name: 'Pedamma temple'),
    Station(id: 20, name: 'Madhapur'),
    Station(id: 21, name: 'Durgama cheruvu'),
    Station(id: 22, name: 'Hitech city'),
    Station(id: 23, name: 'Raidurg'),
  ];
  
  List<AvailableRoutes> routeList = [
    AvailableRoutes(
        routeNumber: "XYZ9U",
        fareAmount: 30,
        arrivalTime: '10:30 am',
        travelTime: '25 minutes'),
    AvailableRoutes(
        routeNumber: "ABX9U",
        fareAmount: 28,
        arrivalTime: '11:00 am',
        travelTime: '25 minutes'),
    AvailableRoutes(
        routeNumber: "PQR9U",
        fareAmount: 30,
        arrivalTime: '11:30 am',
        travelTime: '25 minutes'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Journey Planner'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(
                Icons.radio_button_checked,
                size: 30,
                color: Colors.blue,
              ),
              title: Text(
                'From',
                style: TextStyle(color: Colors.grey),
              ),
              subtitle: AutoCompleteTextField<Station>(
                style: TextStyle(color: Colors.black, fontSize: 20),
                controller: fromStationController,
                decoration: InputDecoration(
                  hintText: "Source location",
                  hintStyle: TextStyle(color: Colors.grey),
                ),
                itemSubmitted: (item) {
                  setState(() {
                    fromStationController.text = item.name;
                  });
                },
                key: sourceKey,
                suggestions: stationList,
                itemBuilder: (context, item) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 4.0, 4.0, 6.0),
                    child: Text(
                      item.name,
                      style: TextStyle(fontSize: 20),
                    ),
                  );
                },
                itemSorter: (a, b) {
                  return a.name.compareTo(b.name);
                },
                itemFilter: (item, query) {
                  return item.name
                      .toString()
                      .toLowerCase()
                      .startsWith(query.toLowerCase());
                },
                suggestionsAmount: 10,
                clearOnSubmit: false,
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
                    setState(() {
                      if (fromStationController != null &&
                          toStationController != null) {
                        temporaryController.value = fromStationController.value;
                        fromStationController.value = toStationController.value;
                        toStationController.value = temporaryController.value;
                      }
                    });
                  }),
            ),
            ListTile(
              leading: Icon(Icons.location_on, size: 30, color: Colors.red),
              title: Text('To', style: TextStyle(color: Colors.grey)),
              subtitle: AutoCompleteTextField<Station>(
                style: TextStyle(color: Colors.black, fontSize: 20),
                controller: toStationController,
                decoration: InputDecoration(
                  hintText: "Destination location",
                  hintStyle: TextStyle(color: Colors.grey),
                ),
                itemSubmitted: (item) {
                  setState(() {
                    toStationController.text = item.name;
                  });
                },
                key: destinationKey,
                suggestions: stationList,
                itemBuilder: (context, item) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 4.0, 4.0, 6.0),
                    child: Text(
                      item.name,
                      style: TextStyle(fontSize: 20),
                    ),
                  );
                },
                itemSorter: (a, b) {
                  return a.name.compareTo(b.name);
                },
                itemFilter: (item, query) {
                  return item.name
                      .toString()
                      .toLowerCase()
                      .startsWith(query.toLowerCase());
                },
                suggestionsAmount: 10,
                clearOnSubmit: false,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 20),
              height: 50,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)),
                color: Colors.blue,
                onPressed: () {
                  Station from = stationList
                      .firstWhere((s) => s.name == fromStationController.text);
                  Station to = stationList
                      .firstWhere((s) => s.name == toStationController.text);
                  if (from != null && to != null) {
                    var intermediateStations = stationList
                        .where((station) =>
                            (station.id >= from.id && station.id <= to.id) ||
                            (station.id >= to.id && station.id <= from.id))
                        .toList();
                    print('Route:');
                    for (var i in to.id >= from.id
                        ? intermediateStations
                        : intermediateStations.reversed) {
                      print(i.name);
                    }
                  }
                },
                child: Text(
                  'Plan Journey',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Text(
              'Available Routes',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(
              color: Colors.blue,
              thickness: 3,
              height: 20,
            ),
            ListView.builder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemCount: routeList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: Card(
                    elevation: 5.0,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: ListTile(
                            title: Row(
                              children: <Widget>[
                                Text(
                                  routeList[index].routeNumber,
                                  style: TextStyle(
                                      fontSize: 22, color: Colors.black),
                                ),
                                Expanded(
                                  child: Text(
                                    'Rs. ${routeList[index].fareAmount}',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            subtitle: Column(
                              children: <Widget>[
                                Divider(
                                  color: Colors.grey.shade900,
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      '${routeList[index].arrivalTime}',
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: <Widget>[
                                          Icon(
                                            Icons.access_time,
                                            size: 20,
                                            color: Colors.red,
                                          ),
                                          Text(
                                            ' ${routeList[index].travelTime}',
                                            style: TextStyle(
                                              fontSize: 18,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            trailing: Icon(Icons.chevron_right),
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => JourneyPage()));
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AvailableRoutes {
  String routeNumber;
  double fareAmount;
  String arrivalTime;
  String travelTime;

  AvailableRoutes(
      {@required this.routeNumber,
      @required this.fareAmount,
      @required this.arrivalTime,
      @required this.travelTime});
}
