import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:clima/Services/Location.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
  }

  Future<void> getData() async {
    http.Response response = await http.get(
        "https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=8d4f2ee98cf5699ee66dd49124b38188");
    String data = response.body;
    print(data);
    var longitude = jsonDecode(data)['coord']['lon'];
    var latitude = jsonDecode(data)['coord']['lat'];
    var WeatherDescription = jsonDecode(data)['weather'][0]['description'];
    print(WeatherDescription);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();

  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold();
  }
}
