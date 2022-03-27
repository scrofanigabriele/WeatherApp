import './weather_day.dart';

class WeatherForecast {
  final List<WeatherDay> _dayForecast = [];

  // List<WeatherDay> get dayForecast {
  //   return [..._dayForecast];
  // }
  //
  //
  //
  void addForecast(WeatherDay dayForecast) {
    _dayForecast.add(dayForecast);
      // notifyListeners();
    }

}