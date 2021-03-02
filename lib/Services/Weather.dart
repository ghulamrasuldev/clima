
import 'package:clima/Services/Location.dart';
import 'package:clima/Services/NetworkHelper.dart';
const apiKey = '8d4f2ee98cf5699ee66dd49124b38188';
const OpenWeatherMapUrl = 'https://api.openweathermap.org/data/2.5/weather?';
class WeatherModel {

  Future<dynamic> getCityWeather (String cityName) async{

    Location location = Location();
    await location.getCurrentLocation();
    NetworkHelper netwokHelper = NetworkHelper(
        '${OpenWeatherMapUrl}'
            'q=$cityName'
            '&appid=$apiKey'
            '&'
            'units=metric');
    var weatherData = await netwokHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather () async{
    Location location = Location();
    await location.getCurrentLocation();
    NetworkHelper netwokHelper = NetworkHelper(
        '${OpenWeatherMapUrl}'
            'lat=${location.lattitude}'
            '&'
            'lon=${location.longitude}'
            '&appid=$apiKey'
            '&'
            'units=metric');
    var weatherData = await netwokHelper.getData();
    return weatherData;
  }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}