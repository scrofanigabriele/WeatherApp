
import 'package:flutter/cupertino.dart';
import 'package:weather_app/tab_bar_page/abstraction/select_page_controller.dart';

class SimpleSelectPageImplementation with ChangeNotifier implements SelectPageController{
  @override
  int _selectedIdx = 0;

  int get selectedIdx{
    return _selectedIdx;
  }

  @override
  changeSelectedIdx(int newIdx) {
    _selectedIdx = newIdx;
    notifyListeners();
  }

}