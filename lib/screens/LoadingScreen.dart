import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:clima/Services/Location.dart';
import 'package:clima/Services/NetworkHelper.dart';

const apiKey = '8d4f2ee98cf5699ee66dd49124b38188';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double lattitude;
  double longitude;
  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    lattitude = location.lattitude;
    longitude = location.longitude;
    NetworkHelper netwokHelper  = NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=$lattitude&lon=$longitude&appid=$apiKey');
    var weatherData = await netwokHelper.getData();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
