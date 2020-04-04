import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({
    Key key,
    @required this.fragmentTitles,
    @required this.fragmentRoutes,
    @required this.fragmentIcons,
    @required this.user,
  }) : super(key: key);

  final List<String> fragmentTitles;
  final List<String> fragmentRoutes;
  final List<Widget> fragmentIcons;
  final FirebaseUser user;

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("${widget.user.displayName}"),
            accountEmail: Text("${widget.user.email}"),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage("${widget.user.photoUrl}"),
              ),
            ),
          ),
          ListView.builder(
            itemCount: widget.fragmentTitles.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return Column(
                children: <Widget>[
                  ListTile(
                    leading: widget.fragmentIcons[index],
                    title: Text(
                      '${widget.fragmentTitles[index]}',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.pushNamed(
                          context, '/${widget.fragmentRoutes[index]}');
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
