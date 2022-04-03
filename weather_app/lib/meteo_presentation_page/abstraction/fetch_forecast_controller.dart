import '../../select_city_page/implementation/city_list.dart';
abstract class FetchForecastController {
  String cityName;

  Future fetchForecast();
}

abstract class FetchSelectedCityForecastController {
  SelectedCity selectedCity;

  Future fetchForecast();
}