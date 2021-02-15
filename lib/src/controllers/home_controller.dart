import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_test_good_meal_app/src/apis/open_weather_api.dart';
import 'package:flutter_app_test_good_meal_app/src/models/weather_day.dart';
import 'package:flutter_app_test_good_meal_app/src/util/constants.dart';
import 'package:get/get.dart';

class HomeController extends GetxController
{
  TextEditingController searchTextFieldController = TextEditingController();
  List<WeatherDay> weatherDays = new List();
  String currentCityName = '';

  @override
  void onInit() {
    super.onInit();

    _fetchForecast('Santiago'); //By default Santiago
  }

  searchForecast() {
    //Hide Keyboard
    FocusScope.of(Get.context).unfocus();

    if( (searchTextFieldController != null) && (searchTextFieldController.text.isNotEmpty) )
      _fetchForecast(searchTextFieldController.text);
    else
      Get.dialog(
          AlertDialog(
            title: Text('Atención'),
            content: Text('Ciudad no puede estar vacía.'),
          )
      );
  }

  _fetchForecast(String place) async {
    final response = await getDailyForecast(place, defaultDaysOpenWeather);

    if( (response != null) && (response.statusCode == 200) ) {

      List<dynamic> list = response.data["list"] as List;
      weatherDays = list.map((result) => WeatherDay.fromJson(result)).toList();

      updateCurrentCityName();
      //GetX Update views
      update(['weatherInformation']);
    } else
      Get.dialog(
          AlertDialog(
            title: Text('Alerta!'),
            content: Text('Ocurrió un error no inesperado.'),
          )
      );
  }

  updateCurrentCityName() {
    print('updateCurrentCityName');
    currentCityName = searchTextFieldController.text;
    print('currentCityName: ' + currentCityName);
    update(['currentCityName']);
  }

  @override
  void onClose() {
    return super.onClose();
  }

  @override
  void onReady() {
    super.onReady();
  }
}