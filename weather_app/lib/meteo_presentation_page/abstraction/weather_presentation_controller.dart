import 'package:flutter/cupertino.dart';

import './fetch_forecast_controller.dart';
import './fetched_data_formatter.dart';


abstract class WeatherPresentationController {
  FetchForecastController forecastController;
  FetchedDataFormatter fetchedDataFormatter;

  fetchAndFormatData();

  // formatFetchedData();
}
