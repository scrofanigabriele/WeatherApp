import 'package:flutter/material.dart';

import './weather_presentation_implementation.dart';
import '../presentation/weather_presentation.dart';

import 'package:flutter_typeahead/flutter_typeahead.dart';
import '../../select_city_page/implementation/city_list.dart';

class WeatherPageBuilder extends StatefulWidget {
  WeatherPresentationBuilder controller;

  WeatherPageBuilder({Key key, @required this.controller}) : super(key: key);

  @override
  State<WeatherPageBuilder> createState() => _WeatherPageBuilderState();
}

class _WeatherPageBuilderState extends State<WeatherPageBuilder> {
  var returnWidget;

  buildWidget() {
    final TextEditingController _typeAheadController = TextEditingController();

    return FutureBuilder(
        future: widget.controller.fetchAndFormatData(),
        builder: (BuildContext context, AsyncSnapshot formattedWeatherData) {
          if (!formattedWeatherData.hasData) {
            print('noDataYet');
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            var widgetReturn = Column(
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
                        widget.controller.selectedCity
                            .changeSelection(suggestion.toString());
                      },
                      validator: (suggestion) {
                        var exist = cities.where(
                            (element) => element == suggestion.toString());
                        if (exist == null) {
                          print('errore');
                          return 'select a proper city form the list';
                        } else {
                          return null;
                        }
                      },
                      onSuggestionSelected: (suggestion) {
                        widget.controller.selectedCity
                            .changeSelection(suggestion.toString());
                        // Navigator.of(context).popAndPushNamed(SearchPage.routeName);
                      },
                    ),
                    height: 40,
                  ),
                ),
                WeatherPresentation(
                  weatherForecast: formattedWeatherData.data,
                ),
              ],
            );
            return widgetReturn;
          }
        });
  }

  @override
  void initState() {
    returnWidget = buildWidget();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widget.controller.selectedCity.addListener(() {
      if (mounted) {
        setState(() {
          returnWidget = buildWidget();
        });
      }
    });
    return returnWidget;
  }
}
