import 'package:clima/screens/LocationScreen.dart';
import 'package:flutter/material.dart';
import 'package:clima/Services/Location.dart';
import 'package:clima/Services/NetworkHelper.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


const apiKey = '8d4f2ee98cf5699ee66dd49124b38188';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    NetworkHelper netwokHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.lattitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    var weatherData = await netwokHelper.getData();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LocationScreen(locationWeather: weatherData,);
        },
      ),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      )
    );
  }
}
