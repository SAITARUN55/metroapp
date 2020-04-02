import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:metroapp/providers/user_auth.dart';
import 'package:metroapp/widgets/login_auth_card.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    final user = Provider.of<UserAuth>(context);
    return Scaffold(
      key: _key,
      // resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(250, 218, 94, 1).withOpacity(0.4),
                  Color.fromRGBO(255, 188, 117, 1).withOpacity(1),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0, 1],
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              height: deviceSize.height,
              width: deviceSize.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  LoginAuthCard(),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "OR",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Login via",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      user.status == Status.Authenticating
                          ? Center(child: CircularProgressIndicator())
                          : InkWell(
                              child: CircleAvatar(
                                radius: 36,
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Container(
                                    padding: EdgeInsets.all(4),
                                    child: Text("Google"),
                                  ),
                                ),
                              ),
                              onTap: () => user
                                  .signInWithGoogle()
                                  .then((FirebaseUser user) => print(user))
                                  .catchError((e) => print(e)),
                            ),
                      CircleAvatar(
                        radius: 36,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Container(
                            padding: EdgeInsets.all(4),
                            child: Text("Facebook"),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
