import 'package:flutter/material.dart';
import 'package:flutter_app_test_good_meal_app/src/pages/home_page.dart';
import 'package:get/get.dart';

void main() async {

  Widget _defaultHome = HomePage();

  runApp(
      GetMaterialApp(
        title: 'Weather GoodMeal APP',
        debugShowCheckedModeBanner: false,
        home: _defaultHome,
        theme: ThemeData(
          primaryColor: Colors.grey,
          accentColor: Colors.blueGrey,
        ),
        routes: <String, WidgetBuilder>{
          '/home': (BuildContext context) => HomePage(),
        },
      )
  );
}