import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:metroapp/navigation_bar_pages/about_nav_page.dart';
import 'package:metroapp/navigation_bar_pages/fare_nav_page.dart';
import 'package:metroapp/navigation_bar_pages/logout_nav_page.dart';
import 'package:metroapp/navigation_bar_pages/metro_map_nav_page.dart';
import 'package:metroapp/navigation_bar_pages/privacy_policy_nav_page.dart';
import 'package:metroapp/navigation_bar_pages/rate_app_nav_page.dart';
import 'package:metroapp/navigation_bar_pages/routes_nav_page.dart';
import 'package:metroapp/navigation_bar_pages/send_feedback_nav_page.dart';
import 'package:metroapp/navigation_bar_pages/settings_nav_page.dart';
import 'package:metroapp/pages/auth_page.dart';
import 'package:metroapp/pages/cities_page.dart';
import 'package:metroapp/navigation_bar_pages/share_nav_page.dart';
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
