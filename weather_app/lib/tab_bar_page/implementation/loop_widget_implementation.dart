import 'package:flutter/material.dart';

import './single_tab_item.dart';
import '../abstraction/loop_widget_builder.dart';


class LoopTabBuilder implements LoopWidgetsBuilder{
  @override
  List widgetItemList;

  LoopTabBuilder({@required this.widgetItemList});

  @override
  listBuildLoop() {
    List<Tab> tabList = [];
    for (SingleTabItem singleTabItem in widgetItemList) {
      tabList.add(Tab(
        icon: singleTabItem.icon,
        child: Text(singleTabItem.title),
      ));
    }
    return tabList;
  }
}

class LoopWidgetBuilder implements LoopWidgetsBuilder{
  @override
  List widgetItemList;

  LoopWidgetBuilder({@required this.widgetItemList});

  @override
  listBuildLoop() {
    List<Widget> widgetList = [];
    for (SingleTabItem singleWidgetItem in widgetItemList) {
      widgetList.add(singleWidgetItem.widget);
    }
    return widgetList;
  }

}