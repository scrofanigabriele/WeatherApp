import '../implementation/single_tab_item.dart';

abstract class TabBarPageSelectionController {
  List<SingleTabItem> tabBarItemList;

  buildTabBar();
}
