import 'package:flutter/material.dart';
import 'package:flutter_app_test_good_meal_app/src/components/daily_item_widget.dart';
import 'package:flutter_app_test_good_meal_app/src/controllers/home_controller.dart';
import 'package:flutter_app_test_good_meal_app/src/models/weather_day.dart';
import 'package:flutter_app_test_good_meal_app/src/util/constants.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (_) => Scaffold(
        body: SafeArea(
          child: buildHomeView(_),
        ),
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
                      _.searchForecast();
                    },
                  ),
                  SizedBox(width: 10),
                  Expanded(
                      child: TextField(
                          controller: _.searchTextFieldController,
                          decoration: InputDecoration.collapsed(
                              hintText: "Ingrese ciudad..."
                          ),
                          onSubmitted: (value) => {
                            _.searchForecast()
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
                width: double.maxFinite,
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //CityName
                    GetBuilder<HomeController>(
                        id: 'currentCityName',
                        builder: (value) => Text(
                          _.currentCityName.toUpperCase(),
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 32,
                              fontWeight: FontWeight.bold
                          ),
                        )
                    ),
                    SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //Min
                            Text(
                              _.weatherDays[0].tempMin.toString() + '°C',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 32,
                              ),
                            ),
                            Container(
                              color: Colors.black,
                              margin: EdgeInsets.all(12),
                              child: Icon(
                                Icons.check_box_outline_blank
                              ),
                            ),
                            //Max
                            Text(
                              _.weatherDays[0].tempMax.toString() + '°C',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 32
                              ),
                            )
                          ],
                        ),
                        SizedBox(width: 18),
                        //Icon
                        Container(
                          alignment: Alignment.center,
                          child: Container(
                            width: 70.0,
                            height: 70.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                image: DecorationImage(
                                    image: NetworkImage(
                                      iconUrlOpenWeather + _.weatherDays[0].weatherIcon + '@2x.png',
                                    ),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),
                        )
                      ],
                    ),
                    buildDailySummary(_.weatherDays)
                  ],
                ),
              )
          ),
        ],
      ),
    );
  }

  Widget buildDailySummary(List<WeatherDay> dailyForecast) {
    //Remove Today
    if(dailyForecast.length != 3)
      dailyForecast.removeAt(0);

    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: dailyForecast.map(
                (item) => new DailyItemWidget(
                    weatherDay: item
                )
        ).toList()
    );
  }
}