import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

import '../abstraction/fetch_forecast_controller.dart';
import '../../select_city_page/implementation/city_list.dart';

class HttpFetchForecast implements FetchForecastController {
  @override
  String cityName;

  HttpFetchForecast({@required this.cityName});

  @override
  fetchForecast() async {
    print('fetching data = $cityName');
    // var dataUrl =
    //     'https://api.weatherbit.io/v2.0/forecast/daily?city=london&key=0a5a89cbc5ca43e18dcd31fdb80e21a5';
    var dataUrl =
        'https://api.weatherbit.io/v2.0/forecast/daily?city=$cityName&key=0a5a89cbc5ca43e18dcd31fdb80e21a5';
    final response = await http.get(Uri.parse(dataUrl));
    final fetchedData = json.decode(response.body) as Map<String, dynamic>;

    return fetchedData;
  }
}

class JsonFetchForecast implements FetchForecastController {
  @override
  String cityName;

  JsonFetchForecast({@required this.cityName});

  @override
  fetchForecast() async {
    final response = await rootBundle
        .loadString('assets/weather.json');

    var fetchedData = json.decode(response.toString()) as Map<String, dynamic>;

    return fetchedData;
  }
}


class HttpFetchSelectedCityForecast implements FetchSelectedCityForecastController {
  @override
  SelectedCity selectedCity;

  HttpFetchSelectedCityForecast({@required this.selectedCity});

  @override
  fetchForecast() async {
    print('fetching data = ${selectedCity.name}');
    // var dataUrl =
    //     'https://api.weatherbit.io/v2.0/forecast/daily?city=london&key=0a5a89cbc5ca43e18dcd31fdb80e21a5';
    var dataUrl =
        'https://api.weatherbit.io/v2.0/forecast/daily?city=${selectedCity.name}&key=0a5a89cbc5ca43e18dcd31fdb80e21a5';
    final response = await http.get(Uri.parse(dataUrl));
    final fetchedData = json.decode(response.body) as Map<String, dynamic>;

    return fetchedData;
  }

}
