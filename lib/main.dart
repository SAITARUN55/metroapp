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
import 'package:metroapp/fragments/share_frag.dart';
import 'package:metroapp/pages/intro_slider.dart';


void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Metro App",
    routes: {
      '/': (context) => IntroScreen(),
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
  ));
}

