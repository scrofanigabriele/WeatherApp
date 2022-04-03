import 'package:flutter/cupertino.dart';

abstract class SelectPageController with ChangeNotifier{
  int _selectedIdx;

  get selectedIdx;

  changeSelectedIdx(int newIdx);
}