import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mausamapp/Services/weather_service.dart';

import '../models/weather_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  //api key
  final _weatherService = WeatherService('a0e4f7f02c4f8ccf64f342d26422c299');
  Weather? _weather;

  //fetch weather
  _fetchWeather() async{
    String cityName = await _weatherService.getCurrentCity();

    try{
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    }
    catch(e){
      print(e);
    }
}

  //weather Animation
  String getWeatherAnimation(String? mainCondition){
    if(mainCondition == null) return 'assets/sunny.json';

    switch(mainCondition.toLowerCase()){
      case 'cloud':
      case 'mist':
      case 'smoke':
      case 'haze':
      case 'dust':
      case 'fog':
        return 'assets/cloud.json';
      case 'rain':
      case 'shower rain':
      case 'thunderstorm':
        return'assets/Raining.json';
      case 'drizzle':
        return'assets/sunny_cloudy.json';
      default:
        return'assets/sunny.json';

    }
  }




  //init state
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //fetch weather on startup
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey[800],
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //city name
            Text(_weather?.cityName ?? "loading City .."),

            //animation
            Lottie.asset(getWeatherAnimation(_weather?.mainCondititon)),
            //temperature
            Text('${_weather?.temperature.round()}C'),

            //weather condition
            Text(_weather?.mainCondititon ?? ""),
          ],
        ),
      )
    );
  }
}
