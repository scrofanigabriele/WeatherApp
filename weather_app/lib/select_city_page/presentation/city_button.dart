import 'package:flutter/material.dart';

import '../implementation/city_list.dart';
import '../../tab_bar_page/abstraction/select_page_controller.dart';


class CityButton extends StatefulWidget {
  String cityName;
  SelectedCity selectedCity;
  SelectPageController tabIdx;


  CityButton({@required this.cityName,@required this.selectedCity,@required this.tabIdx});

  @override
  State<CityButton> createState() => _CityButtonState();
}

class _CityButtonState extends State<CityButton> {

  void _selectCity(String newCity) {
    widget.selectedCity.changeSelection(newCity);
    widget.tabIdx.changeSelectedIdx(0);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectCity(widget.cityName),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: Text(
            widget.cityName,
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.amberAccent,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
