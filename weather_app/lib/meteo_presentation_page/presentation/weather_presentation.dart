import 'package:flutter/material.dart';

import 'weather_row.dart';
import '../implementation/weather_day.dart';





class WeatherPresentation extends StatelessWidget {
  String _cityName;
  WeatherPresentation(this._cityName);

  bool isInit = true;
  List<WeatherDay> _weatherForecast = [];

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
