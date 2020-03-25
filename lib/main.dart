import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:metroapp/fragments/about_frag.dart';
import 'package:metroapp/fragments/fare_frag.dart';
import 'package:metroapp/fragments/logout_frag.dart';
import 'package:metroapp/fragments/metro_map_frag.dart';
import 'package:metroapp/fragments/privacy_policy_frag.dart';
import 'package:metroapp/fragments/rate_app_frag.dart';
import 'package:metroapp/fragments/routes_frag.dart';
import 'package:metroapp/fragments/send_feedback_frag.dart';
import 'package:metroapp/fragments/settings_frag.dart';
import 'package:metroapp/pages/auth_page.dart';
import 'package:metroapp/pages/cities_page.dart';
import 'package:metroapp/fragments/share_frag.dart';
import 'package:metroapp/providers/user_auth.dart';
import 'package:provider/provider.dart';

FirebaseAnalytics analytics = FirebaseAnalytics();
void main() {
  runApp(
    new MaterialApp(
      title: "Metro App",
      routes: {
        // '/': (context) => CitiesPage(),
        '/': (context) => HandleCurrentScreen(),
        '/about': (context) => AboutFragment(),
        '/routes': (context) => RoutesFragment(),
        '/fare': (context) => FareFragment(),
        '/metroMap': (context) => MetroMapFragment(),
        '/settings': (context) => SettingsFragment(),
        '/sendFeedback': (context) => SendFeedbackFragment(),
        '/share': (context) => ShareFragment(),
        '/rateTheApp': (context) => RateAppFragment(),
        '/privacyPolicy': (context) => PrivacyPolicyFragment(),
        '/Logout': (context) => LogoutFragment(),
      },
    ),
  );
}

class HandleCurrentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserAuth.instance(),
      child: Consumer(
        builder: (context, UserAuth user, _) {
          switch (user.status) {
            case Status.Uninitialized:
              return AuthPage();
            case Status.Unauthenticated:
            case Status.Authenticating:
              return AuthPage();
            case Status.Authenticated:
              return CitiesPage(user: user.user);
          }
        },
      ),
    );
  }
}
