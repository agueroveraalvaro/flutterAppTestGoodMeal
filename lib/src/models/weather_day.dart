
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
        json['temp']['day'],//tempDay
        json['temp']['min'],//tempMin
        json['temp']['max'],//tempMax
        json['temp']['night'],//tempNight
        json['temp']['eve'],//tempEve
        json['temp']['morn'],//tempMorn
        json['feels_like']['day'],//feelsLikeDay
        json['feels_like']['night'],//feelsLikeNight
        json['feels_like']['eve'],//feelsLikeEve
        json['feels_like']['morn'],//feelsLikeMorn
        json['pressure'],//pressure
        json['humidity'],//humidity
        json['weather'][0]['id'],//weatherId
        json['weather'][0]['main'],//weatherMain
        json['weather'][0]['description'],//weatherDescription
        json['weather'][0]['icon'],//weatherIcon
        json['speed'],//speed
        json['deg'],//deg
        json['clouds'],//clouds
        json['pop']//pop
    );
  }
}








