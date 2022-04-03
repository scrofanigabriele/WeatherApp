import 'package:flutter/material.dart';

import '../implementation/single_tab_item.dart';
import '../implementation/loop_widget_implementation.dart';
import '../abstraction/tab_bar_page_selection_controller.dart';
import '../abstraction/select_page_controller.dart';

class SimpleTabBarSelectionPageController
    implements TabBarPageSelectionController {
  @override
  List<SingleTabItem> tabBarItemList;

  @override
  SelectPageController tabIdx;

  SimpleTabBarSelectionPageController(
      {@required this.tabBarItemList, @required this.tabIdx});

  @override
  buildTabBar(TabController _tabController) {
    return DefaultTabController(
      length: tabBarItemList.length,
      initialIndex: tabIdx.selectedIdx,
      child: Scaffold(
        bottomNavigationBar: TabBar(
          indicatorColor: Colors.black,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.amberAccent,
          tabs: LoopTabBuilder(widgetItemList: tabBarItemList).listBuildLoop(),
        ),
        body: TabBarView(
          children:
              LoopWidgetBuilder(widgetItemList: tabBarItemList).listBuildLoop(),
        ),
      ),
    );
    throw UnimplementedError();
  }
}

class DefaultTabBarSelectorController implements TabBarPageSelectionController {
  DefaultTabBarSelectorController(
      { @required this.tabBarItemList, @required this.tabIdx});

  @override
  List<SingleTabItem> tabBarItemList;

  @override
  SelectPageController tabIdx;

  @override
  buildTabBar(TabController _tabController) {
    _tabController.index = tabIdx.selectedIdx;
    return Scaffold(
      bottomNavigationBar: TabBar(
        indicatorColor: Colors.black,
        labelColor: Colors.black,
        unselectedLabelColor: Colors.amberAccent,
        controller: _tabController,
        tabs: LoopTabBuilder(widgetItemList: tabBarItemList).listBuildLoop(),
      ),
      body: TabBarView(
        controller: _tabController,
        children:
            LoopWidgetBuilder(widgetItemList: tabBarItemList).listBuildLoop(),
      ),
    );
  }
}