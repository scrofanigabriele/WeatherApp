import 'package:flutter/material.dart';

import '../meteo_presentation_page/presentation/weather_presentation.dart';
import '../select_city_page/presentation/select_city_page.dart';

class BottomBar extends StatefulWidget {
  final int index;

  BottomBar(this.index);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {

  void _selectPage(int index){
    if (index == 0) {
      Navigator.of(context).pushReplacementNamed('/');
    } else if (index == 1) {
      Navigator.of(context).pushReplacementNamed(SelectCity.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: _selectPage,
      backgroundColor: Colors.grey,
      unselectedItemColor: Colors.white,
      selectedItemColor: Colors.amberAccent,
      currentIndex: widget.index,
      items: [
        BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.search),
            label: 'Search'),
        BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.domain),
            label: 'Select City')
      ],
    );
  }
}
