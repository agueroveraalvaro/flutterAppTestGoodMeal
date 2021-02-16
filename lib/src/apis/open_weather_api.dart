import 'package:dio/dio.dart';
import 'package:flutter_app_test_good_meal_app/src/util/constants.dart';

Future<Response> getDailyForecast(String place, int days) async {
  try {
    Response response = await Dio().get(
        urlApiOpenWeather + 'daily?q=' + place + '&cnt=' + days.toString() + '&units=metric&lang=sp&APPID=' + apiKeyOpenWeather
    );
    return response;
  } catch (e) {
    print(e);
  }
  return null;
}