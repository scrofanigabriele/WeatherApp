import 'package:flutter/cupertino.dart';

import './fetch_forecast_controller.dart';
import './weatherbit_fetched_data_formatter.dart';


abstract class WeatherPresentationController {
  FetchForecastController forecastController;
  WeatherBitFetchedDataFormatter fetchedDataFormatter;

  fetchAndFormatData();

  // formatFetchedData();
}
