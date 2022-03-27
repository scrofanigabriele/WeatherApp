import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:weather_app/providers/city_list.dart';

import '../widgets/weather_presentation.dart';
import 'select_city_page.dart';
import 'package:provider/provider.dart';

import '../widgets/bottom_bar.dart';

class SearchPage extends StatefulWidget {
  static const routeName = '/searchPage';

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
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
              child: TypeAheadField(
                textFieldConfiguration: TextFieldConfiguration(
                    decoration: InputDecoration(
                        labelText: 'Select City'
                    )
                ),
                suggestionsCallback: (pattern) async {
                  return cities;
                },
                itemBuilder: (context, suggestion) {
                  return ListTile(
                    title: Text(suggestion.toString()),
                  );
                },
                onSuggestionSelected: (suggestion){
                  selectedCity.changeSelection(suggestion.toString());
                  // Navigator.of(context).popAndPushNamed(SearchPage.routeName);
                },
              ),
              // child: TextField(
              //   decoration: InputDecoration(
              //     border: OutlineInputBorder(),
              //     labelText: 'Search',
              //   ),
              //   textAlign: TextAlign.center,
              //   onSubmitted: (_){},
              // ),
              height: 40,
            ),
          ),
          WeatherPresentation(true),
        ],
      ),
      bottomNavigationBar: BottomBar(0),
    );
  }
}
