import 'package:wheather/utils/utctolocal.dart';

class city_info {
  String? main;
  String? name;
  String? time;
  double? temp;
  String? urlicon;
  city_info(this.main, this.name, this.time, this.temp, this.urlicon);
  factory city_info.fromjson(Map<dynamic, dynamic> jsonobject) {
    return city_info(
      jsonobject["weather"][0]["main"],
      jsonobject["name"],
      utctolocal(jsonobject["dt"]),
      jsonobject["main"]["feels_like"],
      "https://openweathermap.org/img/w/" +
          jsonobject["weather"][0]["icon"] +
          ".png",
    );
  }
}
