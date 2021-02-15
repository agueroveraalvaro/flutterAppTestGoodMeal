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
    //final dayOfWeek = toBeginningOfSentenceCase(DateFormat('EEE').format(this.weather.date));

    return Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Text(
                'dayOfWeek' ?? '',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w300
                )
            ),
            Row(
              children: [
                Text(
                    weatherDay.tempMin.toString() + '-',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w500
                    )
                ),
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
            Container(
              padding: EdgeInsets.only(left: 2),
              alignment: Alignment.center,
              child: Image.network(
                iconUrlOpenWeather + weatherDay.weatherIcon + '@2x.png',
              ),
            ),
          ],
        )
    );
  }

  /*Widget _mapWeatherConditionToImage(WeatherCondition condition) {
    Image image;
    switch (condition) {
      case WeatherCondition.thunderstorm:
        image = Image.asset('assets/images/thunder_storm_small.png');
        break;
      case WeatherCondition.heavyCloud:
        image = Image.asset('assets/images/cloudy_small.png');
        break;
      case WeatherCondition.lightCloud:
        image = Image.asset('assets/images/light_cloud_small.png');
        break;
      case WeatherCondition.drizzle:
      case WeatherCondition.mist:
        image = Image.asset('assets/images/drizzle_small.png');
        break;
      case WeatherCondition.clear:
        image = Image.asset('assets/images/clear_small.png');
        break;
      case WeatherCondition.fog:
        image = Image.asset('assets/images/fog_small.png');
        break;
      case WeatherCondition.snow:
        image = Image.asset('assets/images/snow_small.png');
        break;
      case WeatherCondition.rain:
        image = Image.asset('assets/images/rain_small.png');
        break;
      case WeatherCondition.atmosphere:
        image = Image.asset('assets/images/atmosphere_small.png');
        break;

      default:
        image = Image.asset('assets/images/light_cloud_small.png');
    }

    return Padding(padding: const EdgeInsets.only(top: 5), child: image);
  }*/
}