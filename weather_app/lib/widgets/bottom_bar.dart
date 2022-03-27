import 'package:flutter/material.dart';
import 'package:weather_app/pages/search_page.dart';

import '../widgets/weather_presentation.dart';
import '../pages/select_city_page.dart';

class BottomBar extends StatefulWidget {
  final int index;

  BottomBar(this.index);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {

  void _selectPage(int index){
    if (index == 0) {
      Navigator.of(context).pushReplacementNamed(SearchPage.routeName);
    } else if (index == 1) {
      Navigator.of(context).pushReplacementNamed('/');
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
