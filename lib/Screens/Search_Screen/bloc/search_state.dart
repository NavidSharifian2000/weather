import 'package:dartz/dartz.dart';
import 'package:wheather/Screens/Main_Screen/data/model/faforite_city_model.dart';
import 'package:wheather/Screens/Search_Screen/data/model/faforite_city_model.dart';

abstract class City_Search_State {}

class City_Search_InitState extends City_Search_State {}

class City_Search_LoadingState extends City_Search_State {}

class City_Search_ssuccessState extends City_Search_State {
  Either<String, List<city_name>> city_name_list;
  City_Search_ssuccessState(this.city_name_list);
}

class City_insert_sucsees extends City_Search_State {
  String City_name;
  City_insert_sucsees(this.City_name);
}
