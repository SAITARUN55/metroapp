import 'package:flutter/material.dart';
import 'package:metroapp/screens/cities_page.dart';
import 'package:metroapp/fragments/about_frag.dart';
import 'package:metroapp/fragments/fare_frag.dart';
import 'package:metroapp/fragments/logout_frag.dart';
import 'package:metroapp/fragments/metro_map_frag.dart';
import 'package:metroapp/fragments/privacy_policy_frag.dart';
import 'package:metroapp/fragments/rate_app_frag.dart';
import 'package:metroapp/fragments/routes_frag.dart';
import 'package:metroapp/fragments/settings_frag.dart';
import 'package:metroapp/widgets/app_drawer.dart';

void main() {
  runApp(new MaterialApp(
    title: "Metro App",
    routes: {
      '/': (context) => Home(),
      '/about': (context) => AboutFragment(),
      '/routes': (context) => RoutesFragment(),
      '/fare': (context) => FareFragment(),
      '/metroMap': (context) => MetroMapFragment(),
      '/settings': (context) => SettingsFragment(),
      '/rateTheApp': (context) => RateAppFragment(),
      '/privacyPolicy': (context) => PrivacyPolicyFragment(),
      '/Logout': (context) => LogoutFragment(),
    },
  ));
}
