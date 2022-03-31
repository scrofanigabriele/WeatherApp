import 'package:flutter/material.dart';
import 'package:weather_app/providers/city_list.dart';

import '../widgets/weather_presentation.dart';
import '../select_city_page/select_city_page.dart';
import 'package:provider/provider.dart';

import '../widgets/bottom_bar.dart';

class MeteoPresentationPage extends StatefulWidget {
  static const routeName = '/';
  @override
  _MeteoPresentationPageState createState() => _MeteoPresentationPageState();
}

class _MeteoPresentationPageState extends State<MeteoPresentationPage> {

  @override
  Widget build(BuildContext context) {
    var _cityName = 'London';
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Page'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Search',
                ),
                textAlign: TextAlign.start,
                onSubmitted: (_){},
              ),
              height: 40,
            ),
          ),
          WeatherPresentation(_cityName),
        ],
      ),
      bottomNavigationBar: BottomBar(0),
    );
  }
}
