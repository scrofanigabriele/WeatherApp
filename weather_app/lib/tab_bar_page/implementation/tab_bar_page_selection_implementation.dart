import 'package:flutter/material.dart';

import '../implementation/single_tab_item.dart';
import '../implementation/loop_widget_implementation.dart';
import '../abstraction/tab_bar_page_selection_controller.dart';



class SimpleTabBarSelectionPageController
    implements TabBarPageSelectionController {
  @override
  List<SingleTabItem> tabBarItemList;

  SimpleTabBarSelectionPageController({@required this.tabBarItemList});

  @override
  buildTabBar() {
    return DefaultTabController(
      length: tabBarItemList.length,
      child: Scaffold(
        appBar: AppBar(title: Text(tabBarItemList[0].title),),
        bottomNavigationBar: TabBar(
          indicatorColor: Colors.black,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.amberAccent,
          tabs: LoopTabBuilder(widgetItemList: tabBarItemList).listBuildLoop(),
        ),
        body:  TabBarView(children: LoopWidgetBuilder(widgetItemList: tabBarItemList).listBuildLoop(),
        ),
      ),
    );
    throw UnimplementedError();
  }
}
