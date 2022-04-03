import 'package:flutter/material.dart';
import 'package:weather_app/meteo_presentation_page/implementation/fetch_forecast_implementation.dart';
import 'package:weather_app/meteo_presentation_page/implementation/weather_presentation_implementation.dart';
import 'package:weather_app/meteo_presentation_page/implementation/fetched_data_implementation.dart';
import 'package:weather_app/select_city_page/implementation/city_list.dart';
import 'package:weather_app/tab_bar_page/implementation/select_page_implementation.dart';

import 'package:weather_app/tab_bar_page/implementation/single_tab_item.dart';
import '../implementation/tab_bar_page_selection_implementation.dart';
import '../implementation/tab_bar_page_builder.dart';
import '../../meteo_presentation_page/implementation/weather_page_builder.dart';
import '../../select_city_page/presentation/cities_grid.dart';
import '../abstraction/select_page_controller.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({Key key}) : super(key: key);

  @override
  _TabBarPageState createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> {
  bool isInit = true;
  var selectedCity = SelectedCity();
  String cityName;
  SelectPageController tabIdx = SimpleSelectPageImplementation();


  @override
  Widget build(BuildContext context) {
    selectedCity.addListener(() {
      setState(() {
      });
    });
    return Scaffold(
      bottomNavigationBar: TabBarPageBuilder(
        controller: DefaultTabBarSelectorController(
          tabIdx: tabIdx,
          tabBarItemList: [
            SingleTabItem(
              icon: Icon(Icons.search),
              title: 'Search',
              widget: WeatherPageBuilder(
                weatherPresentationBuilder: WeatherPresentationBuilder(
                  fetchedDataFormatter:
                      WeatherBitFiveDaysFetchedDataFormatter(),
                  forecastController: HttpFetchSelectedCityForecast(selectedCity: selectedCity,),
                ),
              ),
            ),
            SingleTabItem(
              icon: Icon(Icons.domain),
              title: 'Select City',
              widget: CitiesGrid(
                cities: cities,
                selectedCity: selectedCity,
                tabIdx: tabIdx,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
