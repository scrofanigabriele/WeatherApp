import 'package:flutter/material.dart';
import 'package:weather_app/select_city_page/implementation/city_list.dart';

import '../abstraction/weather_presentation_controller.dart';
import '../abstraction/fetched_data_controller.dart';
import '../abstraction/fetch_forecast_controller.dart';
import './weather_day.dart';

class WeatherPresentationBuilder implements WeatherPresentationController {
  @override
  SelectedCity selectedCity;
  @override
  FetchSelectedCityForecastController forecastController;
  @override
  FetchedDataFormatter fetchedDataFormatter;

  WeatherPresentationBuilder(
      {@required this.forecastController,
      @required this.fetchedDataFormatter,
      @required this.selectedCity});

  @override
  Future<List<WeatherDay>> fetchAndFormatData() async {
    forecastController.selectedCity = selectedCity;
    var fetchedForecast = await forecastController.fetchForecast();
    fetchedDataFormatter.fetchedData = fetchedForecast;
    // print(fetchedForecast.runtimeType);
    List<WeatherDay> formattedFetchedData =
        fetchedDataFormatter.formatWeatherBitFetchedData();
    // print(formattedFetchedData.runtimeType);

    return formattedFetchedData;
  }
}
