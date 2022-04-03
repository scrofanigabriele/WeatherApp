import 'package:flutter/material.dart';

import '../implementation/single_tab_item.dart';
import '../abstraction/select_page_controller.dart';

abstract class TabBarPageSelectionController {
  List<SingleTabItem> tabBarItemList;
  SelectPageController tabIdx;

  buildTabBar(TabController _tabController);
}
