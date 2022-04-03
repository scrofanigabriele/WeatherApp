import '../../select_city_page/implementation/city_list.dart';
import './fetch_forecast_controller.dart';
import './fetched_data_controller.dart';


abstract class WeatherPresentationController {
  SelectedCity selectedCity;
  FetchSelectedCityForecastController forecastController;
  FetchedDataFormatter fetchedDataFormatter;

  fetchAndFormatData();

}
