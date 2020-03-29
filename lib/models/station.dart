import 'package:flutter/cupertino.dart';
import 'package:metroapp/models/geolocation.dart';

class Station{
  final int id;
  final String name;
  final Geolocation location;

  Station({@required this.id, @required this.name, this.location,});
}