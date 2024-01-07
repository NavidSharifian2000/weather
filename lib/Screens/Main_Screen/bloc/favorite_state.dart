import 'package:dartz/dartz.dart';
import 'package:wheather/Screens/Main_Screen/data/model/faforite_city_model.dart';

abstract class CityinfoState {}

class CityInfoInitState extends CityinfoState {}

class CityInfoLoadingState extends CityinfoState {}

class CityInfossuccessState extends CityinfoState {
  Either<String, List<city_info>> city_info_list;
  CityInfossuccessState(this.city_info_list);
}
