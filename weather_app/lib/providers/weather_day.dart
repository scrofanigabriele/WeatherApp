class WeatherDay {
  String day = 'Today';
  String iconId = 'c03d';
  String weatherDescription = 'Broken clouds';
  var maxTemp = 20.0;
  var minTemp = 10.0;

  WeatherDay({
    required this.day,
    required this.iconId,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherDescription,
  });
}
