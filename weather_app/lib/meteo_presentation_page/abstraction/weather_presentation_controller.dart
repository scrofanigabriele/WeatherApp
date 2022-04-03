import './fetch_forecast_controller.dart';
import './fetched_data_controller.dart';


abstract class WeatherPresentationController {
  FetchSelectedCityForecastController forecastController;
  FetchedDataFormatter fetchedDataFormatter;

  fetchAndFormatData();

}
