
class WeatherDay {

  int dt;
  int sunrise;
  int sunset;
  double tempDay;
  double tempMin;
  double tempMax;
  double tempNight;
  double tempEve;
  double tempMorn;
  double feelsLikeDay;
  double feelsLikeNight;
  double feelsLikeEve;
  double feelsLikeMorn;
  int pressure;
  int humidity;
  int weatherId;
  String weatherMain;
  String weatherDescription;
  String weatherIcon;
  double speed;
  int deg;
  int clouds;
  double pop;

  WeatherDay(
      this.dt,
      this.sunrise,
      this.sunset,
      this.tempDay,
      this.tempMin,
      this.tempMax,
      this.tempNight,
      this.tempEve,
      this.tempMorn,
      this.feelsLikeDay,
      this.feelsLikeNight,
      this.feelsLikeEve,
      this.feelsLikeMorn,
      this.pressure,
      this.humidity,
      this.weatherId,
      this.weatherMain,
      this.weatherDescription,
      this.weatherIcon,
      this.speed,
      this.deg,
      this.clouds,
      this.pop
  );

  factory WeatherDay.fromJson(Map<String, dynamic> json) {

    return WeatherDay(
        json['dt'],//dt
        json['sunrise'],//sunrise
        json['sunset'],//sunset
        double.tryParse(json['temp']['day'].toString()),//tempDay
        double.tryParse(json['temp']['min'].toString()),//tempMin
        double.tryParse(json['temp']['max'].toString()),//tempMax
        double.tryParse(json['temp']['night'].toString()),//tempNight
        double.tryParse(json['temp']['eve'].toString()),//tempEve
        double.tryParse(json['temp']['morn'].toString()),//tempMorn
        double.tryParse(json['feels_like']['day'].toString()),//feelsLikeDay
        double.tryParse(json['feels_like']['night'].toString()),//feelsLikeNight
        double.tryParse(json['feels_like']['eve'].toString()),//feelsLikeEve
        double.tryParse(json['feels_like']['morn'].toString()),//feelsLikeMorn
        json['pressure'],//pressure
        json['humidity'],//humidity
        json['weather'][0]['id'],//weatherId
        json['weather'][0]['main'],//weatherMain
        json['weather'][0]['description'],//weatherDescription
        json['weather'][0]['icon'],//weatherIcon
        double.tryParse(json['speed'].toString()),//speed
        json['deg'],//deg
        json['clouds'],//clouds
        double.tryParse(json['pop'].toString())//pop
    );
  }
}








