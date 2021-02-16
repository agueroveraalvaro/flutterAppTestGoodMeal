import 'package:flutter/material.dart';
import 'package:flutter_app_test_good_meal_app/src/models/weather_day.dart';
import 'package:flutter_app_test_good_meal_app/src/util/constants.dart';

class DailyItemWidget extends StatelessWidget {

  final WeatherDay weatherDay;

  DailyItemWidget({Key key, @required this.weatherDay})
      : assert(weatherDay != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                //DayName
                Text(
                    weatherDay.dayName,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w300
                    )
                ),
                Column(
                  children: [
                    //Min
                    Text(
                        weatherDay.tempMin.toString() + '°C',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w500
                        )
                    ),
                    Container(
                      child: Icon(
                        Icons.circle,
                        color: Colors.black38,
                        size: 12,
                      ),
                    ),
                    //Max
                    Text(
                        weatherDay.tempMax.toString() + '°C',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w500
                        )
                    ),
                  ],
                ),
                //Icon
                Container(
                  padding: EdgeInsets.only(left: 2),
                  alignment: Alignment.center,
                  child: Image.network(
                    iconUrlOpenWeather + weatherDay.weatherIcon + '@2x.png',
                  ),
                ),
              ],
            )
        )
    );
  }
}