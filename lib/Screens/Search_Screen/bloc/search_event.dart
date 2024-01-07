import 'package:flutter/material.dart';

abstract class City_SearchEvent {}

class City_Search_getdataEvent extends City_SearchEvent {
  String cityname;
  City_Search_getdataEvent(this.cityname);
}

class insert_city_db_event extends City_SearchEvent {
  String cityname;
  BuildContext context;
  insert_city_db_event(this.cityname, this.context);
}
