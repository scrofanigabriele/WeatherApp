import 'package:flutter/material.dart';
import 'package:weather_app/tab_bar_page/implementation/single_tab_item.dart';

import '../abstraction/tab_bar_page_selection_controller.dart';

class TabBarPageBuilder extends StatefulWidget {
  final TabBarPageSelectionController controller;

  const TabBarPageBuilder({Key key, this.controller}) : super(key: key);

  @override
  _TabBarPageBuilderState createState() => _TabBarPageBuilderState();
}

class _TabBarPageBuilderState extends State<TabBarPageBuilder> {
  @override
  Widget build(BuildContext context) {
    return widget.controller.buildTabBar();
  }

}
