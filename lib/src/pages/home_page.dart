import 'package:flutter/material.dart';
import 'package:flutter_app_test_good_meal_app/src/controllers/home_controller.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (_) => Scaffold(
        appBar: AppBar(),
        body: Container()
      ),
    );
  }
}