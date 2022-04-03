import 'package:flutter/material.dart';

abstract class tabIndexController with ChangeNotifier{
  get selectedIdx;

  changeSelectedIdx(int newIdx);
}