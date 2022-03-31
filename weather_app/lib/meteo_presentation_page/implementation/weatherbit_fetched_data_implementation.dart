import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import '../implementation/weather_day.dart';
import '../abstraction/weatherbit_fetched_data_controller.dart';



class WeatherBitFiveDaysFetchedDataFormatter implements WeatherBitFetchedDataController{
  @override
  var fetchedData;

  WeatherBitFiveDaysFetchedDataFormatter({@required this.fetchedData});

  @override
  formatWeatherBitFetchedData() {
    String day;
    List<WeatherDay> weatherForecast = [];
    for (int i = 0; i < 5; i++) {
      var weatherInfo = fetchedData['data'][i];
      if (DateFormat.EEEE().format(DateTime.parse(weatherInfo['datetime'])) ==
          DateFormat.EEEE().format(DateTime.now())) {
        day = 'Today';
      } else {
        day = DateFormat.EEEE().format(DateTime.parse(weatherInfo['datetime']));
      }
      String iconId =
          'https://www.weatherbit.io/static/img/icons/${weatherInfo['weather']['icon']}.png';
      String weatherDescription = weatherInfo['weather']['description'];
      var maxTemp = weatherInfo['max_temp'].toDouble();
      var minTemp = weatherInfo['low_temp'].toDouble();
      weatherForecast.add(WeatherDay(
          day: day,
          iconId: iconId,
          maxTemp: maxTemp,
          minTemp: minTemp,
          weatherDescription: weatherDescription));
    }
  }
}
