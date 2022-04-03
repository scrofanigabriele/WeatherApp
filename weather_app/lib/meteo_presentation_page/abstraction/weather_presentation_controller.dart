import 'package:flutter/cupertino.dart';

import './fetch_forecast_controller.dart';
import './fetched_data_formatter.dart';


abstract class WeatherPresentationController {
  FetchSelectedCityForecastController forecastController;
  FetchedDataFormatter fetchedDataFormatter;

  fetchAndFormatData();

}
