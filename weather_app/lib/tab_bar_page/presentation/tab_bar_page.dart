import 'package:flutter/material.dart';

import 'package:weather_app/tab_bar_page/implementation/single_tab_item.dart';
import '../implementation/tab_bar_page_selection_implementation.dart';
import './tab_bar_page_builder.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({Key key}) : super(key: key);

  @override
  _TabBarPageState createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TabBarPage'),
      ),
      body: const Center(
        child: Text('body'),
      ),
      bottomNavigationBar: TabBarPageBuilder(
        controller: SimpleTabBarSelectionPageController(
          tabBarItemList: [
            const SingleTabItem(
              icon: Icon(Icons.account_circle_rounded),
              title: 'Prova',
              widget: Text('Pagina della Prova 1'),
            ),
            const SingleTabItem(
              icon: Icon(Icons.airport_shuttle),
              title: 'Prova 2',
              widget: Text('Pagina della Prova 2'),
            ),
          ],
        ),
      ),
    );
  }
}
