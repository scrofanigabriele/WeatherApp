import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../implementation/city_list.dart';

class CityButton extends StatefulWidget {
  final String cityName;

  CityButton(this.cityName);

  @override
  State<CityButton> createState() => _CityButtonState();
}

class _CityButtonState extends State<CityButton> {

  void _selectCity(BuildContext ctx,SelectedCity newCity) {
    newCity.changeSelection(widget.cityName);
    Navigator.of(context).popAndPushNamed('/');
  }

  @override
  Widget build(BuildContext context) {
    // var newCity = Provider.of<SelectedCity>(context);

    return InkWell(
      onTap: () {},//=> _selectCity(context,newCity),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: Text(
            widget.cityName,
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.amberAccent,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
