import 'package:flutter/material.dart';
List cities = [
  'Istanbul',
  'Moscow',
  'London',
  'Saint',
  'Berlin',
  'Madrid',
  'Kyiv',
  'Rome',
  'Bucharest',
  'Paris',
  'Minsk',
  'Vienna',
  'Hamburg',
  'Warsaw',
  'Budapest',
  'Barcelona',
  'Munich',
  'Kharkiv',
  'Milan',
  'Belgrade',
  'Prague',
  'Sofia',
  'Birmingham',
  'Brussels',
  'Samara',
  'Ufa',
  'Rostov',
  'Cologne',
  'Voronezh',
  'Perm',
];

class SelectedCity with ChangeNotifier{
  String _name = 'London';

  String get name{
    // print('Sono dentro');
    // print(_name);
    // print('esco');
    return _name;
  }

  void changeSelection(String newCity) {
    _name = newCity;
    notifyListeners();
}
}