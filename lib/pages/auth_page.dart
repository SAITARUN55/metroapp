import 'package:flutter/material.dart';
import 'package:metroapp/widgets/login_auth_card.dart';

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
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
                      CircleAvatar(
                        radius: 36,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Container(
                            padding: EdgeInsets.all(4),
                            child: Text("Google"),
                          ),
                        ),
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
