import 'package:flutter/material.dart';

import 'bottom_bar.dart';
import '../select_city_page/presentation/cities_grid.dart';

class SelectCity extends StatelessWidget {
  static const routeName = '/selectCity';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select City'),
      ),
      body: CitiesGrid(),
    );
  }
}
