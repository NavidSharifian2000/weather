import 'package:wheather/utils/utctolocal.dart';

class city_name {
  String? name;
  city_name(this.name);
  factory city_name.fromjson(Map<dynamic, dynamic> jsonobject) {
    return city_name(
      jsonobject["name"],
    );
  }
}
