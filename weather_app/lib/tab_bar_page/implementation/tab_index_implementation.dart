import 'package:flutter/cupertino.dart';
import '../abstraction/tab_index_controller.dart';

class SimpleTabIndex with ChangeNotifier implements tabIndexController{
  int _selectedIdx = 0;

  @override
  int get selectedIdx{
    return _selectedIdx;
  }

  @override
  changeSelectedIdx(int newIdx) {
    _selectedIdx = newIdx;
    notifyListeners();
  }

}