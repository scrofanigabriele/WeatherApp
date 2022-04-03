import 'package:flutter/material.dart';

import '../abstraction/tab_bar_page_selection_controller.dart';

class TabBarPageBuilder extends StatefulWidget {
  final TabBarPageSelectionController controller;

  const TabBarPageBuilder({Key key, this.controller}) : super(key: key);

  @override
  _TabBarPageBuilderState createState() => _TabBarPageBuilderState();
}

class _TabBarPageBuilderState extends State<TabBarPageBuilder> with TickerProviderStateMixin{
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: widget.controller.tabBarItemList.length, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return widget.controller.buildTabBar(_tabController);
  }

}
