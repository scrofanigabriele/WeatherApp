import 'package:flutter/material.dart';

import '../implementation/city_list.dart';
import 'city_button.dart';
import '../../tab_bar_page/abstraction/tab_index_controller.dart';


class CitiesGrid extends StatelessWidget {
  List cities;
  SelectedCity selectedCity;
  tabIndexController tabIdx;


  CitiesGrid({@required this.cities,@required this.selectedCity, @required this.tabIdx});
  @override
  Widget build(BuildContext context) {
    // print('sono');
    // print(tabIdx.selectedIdx);
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(cities.length, (index) {
        return Container(
          padding: EdgeInsets.all(10),
            child: CityButton(cityName: cities[index],selectedCity: selectedCity,tabIdx: tabIdx,));
      }),
    );
  }
}
