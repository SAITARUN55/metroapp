import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
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
import 'package:metroapp/pages/cities_page.dart';
import 'package:metroapp/fragments/share_frag.dart';

FirebaseAnalytics analytics = FirebaseAnalytics();
void main() {
  runApp(
    new MaterialApp(
      title: "Metro App",
      routes: {
        '/': (context) => CitiesPage(),
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
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: analytics),
      ],
    ),
  );
}
