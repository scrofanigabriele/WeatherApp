import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import './weather_row.dart';
import '../../select_city_page/implementation/city_list.dart';

class WeatherPresentation extends StatelessWidget {
  var weatherForecast;

  WeatherPresentation({@required this.weatherForecast});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _typeAheadController = TextEditingController();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            child: TypeAheadFormField(
              textFieldConfiguration: TextFieldConfiguration(
                controller: _typeAheadController,
                decoration: InputDecoration(labelText: 'Select City'),
              ),
              suggestionsCallback: (pattern) async {
                return cities;
              },
              itemBuilder: (context, suggestion) {
                return Container(
                  child: ListTile(
                    title: Text(suggestion.toString()),
                  ),
                );
              },
              onSaved: (suggestion) {
                print('saved');
                // selectedCity.changeSelection(suggestion.toString());
              },
              validator: (suggestion) {
                var exist =
                    cities.where((element) => element == suggestion.toString());
                if (exist == null) {
                  print('errore');
                  return 'select a proper city form the list';
                }
              },
              onSuggestionSelected: (suggestion) {
                // selectedCity.changeSelection(suggestion.toString());
                // Navigator.of(context).popAndPushNamed(SearchPage.routeName);
              },
            ),
            height: 40,
          ),
        ),
        ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: weatherForecast.length,
          itemBuilder: (BuildContext context, int index) {
            return WeatherRow(weatherForecast[index]);
          },
        ),
      ],
    );
  }
}
