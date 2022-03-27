import 'package:flutter/material.dart';

import '../widgets/bottom_bar.dart';
import '../widgets/cities_grid.dart';

class SelectCity extends StatelessWidget {
  static const routeName = '/selectCity';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select City'),
      ),
      body: CitiesGrid(),
      bottomNavigationBar: BottomBar(1),
    );
  }
}
