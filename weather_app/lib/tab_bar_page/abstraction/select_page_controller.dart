import 'package:flutter/cupertino.dart';

abstract class SelectPageController with ChangeNotifier{

  get selectedIdx;

  changeSelectedIdx(int newIdx);
}