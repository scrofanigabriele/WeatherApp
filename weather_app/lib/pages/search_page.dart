import 'package:flutter/material.dart';
import 'package:weather_app/providers/city_list.dart';

import '../widgets/weather_presentation.dart';
import 'select_city_page.dart';
import 'package:provider/provider.dart';

import '../widgets/bottom_bar.dart';

class SearchPage extends StatefulWidget {
  static const routeName = '/';
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  @override
  Widget build(BuildContext context) {
    var _cityName = Provider.of<SelectedCity>(context).name;
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
                textAlign: TextAlign.center,
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
