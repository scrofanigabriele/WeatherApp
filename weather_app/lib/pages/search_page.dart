import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:weather_app/providers/city_list.dart';

import '../widgets/weather_presentation.dart';
import 'select_city_page.dart';
import '../providers/city_list.dart';
import 'package:provider/provider.dart';

import '../widgets/bottom_bar.dart';

class SearchPage extends StatefulWidget {
  static const routeName = '/searchPage';

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _typeAheadController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var selectedCity = Provider.of<SelectedCity>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedCity.name),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              child: TypeAheadFormField(
                textFieldConfiguration: TextFieldConfiguration(
                  controller: _typeAheadController,
                    decoration: InputDecoration(
                        labelText: 'Select City'
                    ),
                ),
                suggestionsCallback: (pattern) async {
                  return cities;
                },
                itemBuilder: (context, suggestion) {
                  return ListTile(
                    title: Text(suggestion.toString()),
                  );
                },
                onSaved: (suggestion) {
                  print('saved');
                  selectedCity.changeSelection(suggestion.toString());
                } ,
                validator: (suggestion){
                  var exist = cities.where((element) => element == suggestion.toString());
                  if (exist == null) {
                    print('errore');
                    return 'select a proper city form the list';
                  }
                },
                onSuggestionSelected: (suggestion){
                  selectedCity.changeSelection(suggestion.toString());
                  // Navigator.of(context).popAndPushNamed(SearchPage.routeName);
                },
              ),
              height: 40,
            ),
          ),
          WeatherPresentation(),
        ],
      ),
      bottomNavigationBar: BottomBar(0),
    );
  }
}
