import 'package:flutter/material.dart';

import 'weather_row.dart';
import '../implementation/weather_day.dart';

class WeatherPresentation extends StatelessWidget {
  var weatherForecast;

  WeatherPresentation({@required this.weatherForecast});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: weatherForecast.length,
        itemBuilder: (BuildContext context, int index) {
          return WeatherRow(weatherForecast[index]);
        },
      ),
    );
  }
}
