import 'package:flutter/material.dart';

import '../abstraction/weather_presentation_controller.dart';
import '../abstraction/fetched_data_controller.dart';
import '../abstraction/fetch_forecast_controller.dart';
import './weather_day.dart';

class WeatherPresentationBuilder implements WeatherPresentationController {
  FetchSelectedCityForecastController forecastController;
  FetchedDataFormatter fetchedDataFormatter;

  WeatherPresentationBuilder(
      {@required this.forecastController, @required this.fetchedDataFormatter});

  @override
  fetchAndFormatData() async {
    var fetchedForecast = await forecastController.fetchForecast();
    fetchedDataFormatter.fetchedData = fetchedForecast;
    // print(fetchedForecast.runtimeType);
    List<WeatherDay> formattedFetchedData = fetchedDataFormatter.formatWeatherBitFetchedData();
    // print(formattedFetchedData.runtimeType);

    return formattedFetchedData;
  }
}
