import 'package:flutter/material.dart';

import './weather_row.dart';
import '../providers/weather_forecast.dart';
import '../providers/weather_day.dart';

import 'package:flutter/services.dart';

import 'package:intl/intl.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/providers/weather_forecast.dart';


class WeatherPresentation extends StatefulWidget {
  String _cityName = 'vienna';

  WeatherPresentation(this._cityName);

  @override
  State<WeatherPresentation> createState() => _WeatherPresentationState();
}

class _WeatherPresentationState extends State<WeatherPresentation> {
  bool isInit = true;
  List<WeatherDay> _weatherForecast = [];
  Future<void> fetchAndSetForecast() async {
    // WeatherForecast weatherForecast;
    List<WeatherDay> weatherForecast = [];

    var dataUrl =
        'https://api.weatherbit.io/v2.0/forecast/daily?city=${widget._cityName}&key=38ff7a5f9aa44a4fb8a39690b036d5cb';
    final response = await http.get(Uri.parse(dataUrl));
    final data = json.decode(response.body) as Map<String, dynamic>;
    // print(DateFormat.d('2022-03-26'));

    // final String response = await rootBundle.loadString('assets/weather.json');
    // final data = await json.decode(response);
    String day;
    // print(DateFormat.EEEE().format(DateTime.parse('2022-03-26')));
    // print('provaDecoding');

    for (int i = 0; i < 5; i++) {
      var weatherInfo = data['data'][i];
      if (DateFormat.EEEE().format(DateTime.parse(weatherInfo['datetime'])) == DateFormat.EEEE().format(DateTime.now())){
        day = 'Today';
      } else {
        day = DateFormat.EEEE().format(
            DateTime.parse(weatherInfo['datetime']));
      }

      String iconId = 'https://www.weatherbit.io/static/img/icons/${weatherInfo['weather']['icon']}.png';
      String weatherDescription = weatherInfo['weather']['description'];
      var maxTemp = weatherInfo['max_temp'].toDouble();
      var minTemp = weatherInfo['low_temp'].toDouble();
      // print(day);
      // print(iconId);
      // print(weatherDescription);
      // print(maxTemp.runtimeType);
      // print(minTemp.toString());
      weatherForecast.add(WeatherDay(day: day, iconId: iconId, maxTemp: maxTemp, minTemp: minTemp, weatherDescription: weatherDescription));
    }
  // print(weatherForecast.length.toString());
    setState(() {
      _weatherForecast = weatherForecast;
    });
  }


  @override
  Widget build(BuildContext context){
    if (isInit) {
      fetchAndSetForecast();
      isInit = false;
    }
    return Expanded(

      child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: _weatherForecast.length,
          itemBuilder: (BuildContext context, int index) {
            return WeatherRow(_weatherForecast[index]);
          }),
    );
  }
}
