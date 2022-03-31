import 'package:flutter/material.dart';

import '../../providers/weather_day.dart';

class WeatherRow extends StatelessWidget {
  final WeatherDay weatherDay;

  const WeatherRow(this.weatherDay);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(weatherDay.iconId),
              ),
              SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(weatherDay.day),
                  SizedBox(
                    width: 5,
                  ),
                  Text(weatherDay.weatherDescription),
                ],
              ),
            ],
          ),
          Container(
            width: 100,
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Max',style: TextStyle(fontWeight: FontWeight.bold),),
                    SizedBox(
                      width: 5,
                    ),
                    Text(weatherDay.maxTemp.toString()),
                  ],
                ),
                SizedBox(
                  width: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Min',style: TextStyle(fontWeight: FontWeight.bold),),
                    SizedBox(
                      width: 5,
                    ),
                    Text(weatherDay.minTemp.toString()),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
