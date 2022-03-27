import 'package:flutter/material.dart';

import '../providers/city_list.dart';
import 'city_button.dart';

class CitiesGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(cities.length, (index) {
        return Container(
          padding: EdgeInsets.all(10),
            child: CityButton(cities[index]));
      }),
    );
  }
}
