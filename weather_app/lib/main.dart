import 'package:flutter/material.dart';

import 'tab_bar_page/presentation/tab_bar_page.dart';
import 'widgets/select_city_page.dart';

void main() => runApp(const WeatherApp());

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Weather App',
      theme: ThemeData(appBarTheme: AppBarTheme(backgroundColor: Colors.amber)),
      home: TabBarPage(),
      routes: {
        SelectCity.routeName: (ctx) => SelectCity(),
      },
    );
  }
}
