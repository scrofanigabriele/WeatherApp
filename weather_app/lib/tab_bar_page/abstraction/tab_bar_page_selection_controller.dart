import 'package:flutter/material.dart';

import '../implementation/single_tab_item.dart';
import '../abstraction/tab_index_controller.dart';

abstract class TabBarPageSelectionController {
  List<SingleTabItem> tabBarItemList;
  tabIndexController tabIdx;

  buildTabBar(TabController _tabController);
}
