import 'package:flutter/material.dart';
import 'package:weather_app/meteo_presentation_page/implementation/fetch_forecast_implementation.dart';
import 'package:weather_app/meteo_presentation_page/implementation/weather_presentation_implementation.dart';
import 'package:weather_app/meteo_presentation_page/implementation/weatherbit_fetched_data_implementation.dart';

import 'package:weather_app/tab_bar_page/implementation/single_tab_item.dart';
import '../implementation/tab_bar_page_selection_implementation.dart';
import '../implementation/tab_bar_page_builder.dart';
import '../../meteo_presentation_page/implementation/weather_page_builder.dart';
import '../../select_city_page/presentation/cities_grid.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({Key key}) : super(key: key);

  @override
  _TabBarPageState createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TabBarPage'),
      ),
      body: const Center(
        child: Text('body'),
      ),
      bottomNavigationBar: TabBarPageBuilder(
        controller: SimpleTabBarSelectionPageController(
          tabBarItemList: [
            SingleTabItem(
              icon: Icon(Icons.search),
              title: 'Search',
              widget: WeatherPageBuilder(
                weatherPresentationBuilder: WeatherPresentationBuilder(
                  fetchedDataFormatter:
                      WeatherBitFiveDaysFetchedDataFormatter(),
                  forecastController: HttpFetchForecast(cityName: 'Catania'),
                ),
              ),
            ),
            SingleTabItem(
              icon: Icon(Icons.domain),
              title: 'Select City',
              widget: CitiesGrid(),
            ),
          ],
        ),
      ),
    );
  }
}
