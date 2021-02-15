import 'package:flutter/material.dart';
import 'package:flutter_app_test_good_meal_app/src/controllers/home_controller.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (_) => Scaffold(
        body: SafeArea(
          child: buildHomeView(_),
        )
      ),
    );
  }

  Widget buildHomeView(HomeController _) {
    return Container(
      child: Column(
        children: [
          //Search Text Field
          Container(
              margin: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
              padding: EdgeInsets.only(left: 5, top: 5, right: 20, bottom: 00),
              height: 50,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(3),
                    topRight: Radius.circular(3),
                    bottomLeft: Radius.circular(3),
                    bottomRight: Radius.circular(3)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: new Icon(Icons.search),
                    onPressed: () {
                      //model.updateCity(cityEditController.text);
                      //model.refreshWeather(cityEditController.text, context);
                    },
                  ),
                  SizedBox(width: 10),
                  Expanded(
                      child: TextField(
                          controller: _.searchTextFieldController,
                          decoration: InputDecoration.collapsed(
                              hintText: "Ingrese ciudad..."
                          ),
                          onSubmitted: (String city) => {
                            //model.refreshWeather(city, context)
                          },
                      )
                  ),
                ],
              )
          ),
          //Information Weather
          Expanded(
              flex: 1,
              child: Container(
                color: Colors.redAccent,
              )
          ),
        ],
      ),
    );
  }
}