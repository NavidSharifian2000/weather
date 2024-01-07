import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:wheather/Screens/Main_Screen/bloc/favorite_event.dart';
import 'package:wheather/Screens/Main_Screen/bloc/favorite_state.dart';
import 'package:wheather/Screens/Main_Screen/data/model/faforite_city_model.dart';
import 'package:wheather/Screens/Main_Screen/data/repository/favorite_repository.dart';
import 'package:wheather/Screens/Search_Screen/bloc/search_event.dart';
import 'package:wheather/Screens/Search_Screen/bloc/search_state.dart';
import 'package:wheather/Screens/Search_Screen/data/model/faforite_city_model.dart';
import 'package:wheather/Screens/Search_Screen/data/repository/search_repository.dart';
import 'package:wheather/di/di.dart';

class City_SearchBloc extends Bloc<City_SearchEvent, City_Search_State> {
  ICity_Serach_Repository _repository = locator.get<ICity_Serach_Repository>();
  City_SearchBloc() : super(City_Search_InitState()) {
    on<City_Search_getdataEvent>(
      (event, emit) async {
        emit(City_Search_LoadingState());
        Either<String, List<city_name>> city_name_list =
            await _repository.search_city_name_repository(event.cityname);
        emit(City_Search_ssuccessState(city_name_list));
      },
    );
    on<insert_city_db_event>(
      (event, emit) async {
        String alert = "";
        _repository.insert_city_name_db_repository(event.cityname);
        emit(City_insert_sucsees(event.cityname));
        alert = event.cityname.toString() + " added to favorites";
        ScaffoldMessenger.of(event.context).showSnackBar(SnackBar(
          content: Text(alert),
        ));
      },
    );
  }
}
