import 'package:flutter/material.dart';

import './weather_presentation_implementation.dart';
import '../presentation/weather_presentation.dart';

class WeatherPageBuilder extends StatelessWidget {
  WeatherPresentationBuilder weatherPresentationBuilder;

  WeatherPageBuilder({Key key, @required this.weatherPresentationBuilder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: weatherPresentationBuilder.fetchAndFormatData(),
      builder: (BuildContext context, AsyncSnapshot formattedWeatherData) {
        if (!formattedWeatherData.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return WeatherPresentation(
            weatherForecast: formattedWeatherData.data,
          );
          ;
        }
      },
    );
  }
}
