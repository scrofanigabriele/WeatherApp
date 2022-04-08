import 'package:weather_app/meteo_presentation_page/implementation/weather_day.dart';

import '../../select_city_page/implementation/city_list.dart';
abstract class FetchForecastController {
  String cityName;

  Future fetchForecast();
}

abstract class FetchSelectedCityForecastController {
  SelectedCity selectedCity;

  Future fetchForecast();
}

abstract class WeatherRepository {

  Future<List<WeatherDay>> getWeatherForCity(String city);
}