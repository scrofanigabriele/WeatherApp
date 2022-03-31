import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

import '../abstraction/fetch_forecast_controller.dart';

class HttpFetchForecast implements FetchForecastController {
  @override
  String cityName;

  HttpFetchForecast({@required this.cityName});

  @override
  fetchForecast() async {
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
    var dataUrl =
        'https://api.weatherbit.io/v2.0/forecast/daily?city=$cityName&key=0a5a89cbc5ca43e18dcd31fdb80e21a5';
    final response = await http.get(Uri.parse(dataUrl));
    final fetchedData = json.decode(response.body) as Map<String, dynamic>;
    return fetchedData;
  }
}