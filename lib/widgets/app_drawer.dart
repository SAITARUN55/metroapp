import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    Key key,
    @required this.fragmentTitles,
    @required this.fragmentRoutes,
  }) : super(key: key);

  final List<String> fragmentTitles;
  final List<String> fragmentRoutes;

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                      Navigator.pushNamed(context, '/${fragmentRoutes[index]}');
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
    );
  }
}
