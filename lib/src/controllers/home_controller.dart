import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_test_good_meal_app/src/apis/open_weather_api.dart';
import 'package:flutter_app_test_good_meal_app/src/models/weather_day.dart';
import 'package:get/get.dart';

class HomeController extends GetxController
{
  TextEditingController searchTextFieldController;

  List<WeatherDay> weatherDays = new List();

  @override
  void onInit() {
    super.onInit();

    fetchForecast('Santiago', 4); //By default Santiago with 4 days
  }

  fetchForecast(String place, int days) async {
    final response = await getDailyForecast(place, days);

    if(response.statusCode == 200) {

      List<dynamic> list = response.data["list"] as List;
      weatherDays = list.map((result) => WeatherDay.fromJson(result)).toList();

      //GetX Update views
      update(['weatherDays']);
    } else {
      Get.dialog(
          AlertDialog(
            title: Text('Alerta!'),
            content: Text('Ocurrió un error no inesperado.'),
          )
      );
    }
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