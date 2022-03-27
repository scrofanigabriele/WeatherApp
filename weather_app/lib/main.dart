import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './pages/search_page.dart';
import './providers/city_list.dart';
import './pages/select_city_page.dart';

void main() => runApp(const GHFlutterApp());

class GHFlutterApp extends StatelessWidget {
  const GHFlutterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SelectedCity(),
      child: MaterialApp(
        title: 'My Weather App',
        theme:
            ThemeData(appBarTheme: AppBarTheme(backgroundColor: Colors.amber)),
        home: SearchPage(),
        routes: {
          SelectCity.routeName: (ctx) => SelectCity(),
        },
      ),
    );
  }
}
