import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

import './weather_row.dart';
import '../providers/weather_day.dart';
import '../providers/city_list.dart';

class WeatherPresentation extends StatefulWidget {
  bool isInit = true;


  @override
  State<WeatherPresentation> createState() => _WeatherPresentationState();
}

class _WeatherPresentationState extends State<WeatherPresentation> {
  // String oldCity = '';
  bool _isLoading = false;
  List<WeatherDay> _weatherForecast = [];

  Future<void> fetchAndSetForecast(String selectedCity) async {
    List<WeatherDay> weatherForecast = [];
    String day;
    // print(selectedCity.name);
    var dataUrl =
        'https://api.weatherbit.io/v2.0/forecast/daily?city=${selectedCity}&key=0a5a89cbc5ca43e18dcd31fdb80e21a5';
    _isLoading = true;
    final response = await http.get(Uri.parse(dataUrl));
    final data = json.decode(response.body) as Map<String, dynamic>;
    // print(data);
    for (int i = 0; i < 5; i++) {
      var weatherInfo = data['data'][i];
      if (DateFormat.EEEE().format(DateTime.parse(weatherInfo['datetime'])) ==
          DateFormat.EEEE().format(DateTime.now())) {
        day = 'Today';
      } else {
        day = DateFormat.EEEE().format(DateTime.parse(weatherInfo['datetime']));
      }
      String iconId =
          'https://www.weatherbit.io/static/img/icons/${weatherInfo['weather']['icon']}.png';
      String weatherDescription = weatherInfo['weather']['description'];
      var maxTemp = weatherInfo['max_temp'].toDouble();
      var minTemp = weatherInfo['low_temp'].toDouble();
      weatherForecast.add(WeatherDay(
          day: day,
          iconId: iconId,
          maxTemp: maxTemp,
          minTemp: minTemp,
          weatherDescription: weatherDescription));
    }
    _isLoading = false;
    setState(() {
      _weatherForecast = weatherForecast;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(widget.isInit);
    var selectedCity = Provider.of<SelectedCity>(context).name;
    if (widget.isInit) {
      fetchAndSetForecast(selectedCity);
      widget.isInit = false;
      // print('Sono Dentro');
    }
    // print(isInit);
    return _isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Expanded(
            child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: _weatherForecast.length,
                itemBuilder: (BuildContext context, int index) {
                  return WeatherRow(_weatherForecast[index]);
                }),
          );
  }
}
