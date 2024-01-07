import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:sqflite/sqflite.dart';
import 'package:wheather/Screens/Main_Screen/bloc/favorite_bloc.dart';
import 'package:wheather/Screens/Main_Screen/data/datasource/favorite_datasource.dart';
import 'package:wheather/Screens/Main_Screen/data/repository/favorite_repository.dart';
import 'package:wheather/Screens/Search_Screen/bloc/search_bloc.dart';
import 'package:wheather/Screens/Search_Screen/data/datasource/search_datasource.dart';
import 'package:wheather/Screens/Search_Screen/data/repository/search_repository.dart';
import 'package:wheather/utils/dbconfig.dart';
import 'package:wheather/utils/dio_config.dart';

var locator = GetIt.instance;
Future<void> getInit() async {
  await Makeutils();
  MakeDatasources();
  MakeRepositories();
  Makeblocs();
}

Future<void> Makeutils() async {
  locator.registerSingleton<Database>(await openDatabases());
  locator.registerSingleton<dio_project>(wheather_dio());
}

void Makeblocs() {
  locator.registerSingleton<CityInfoBloc>(CityInfoBloc());
  locator.registerSingleton<City_SearchBloc>(City_SearchBloc());
}

void MakeRepositories() {
  locator.registerSingleton<ICityInfoRepository>(CityInforepository());
  locator.registerSingleton<ICity_Serach_Repository>(City_Search_Repository());
}

void MakeDatasources() {
  locator.registerSingleton<ICityInfoDataSource>(CityInfoRemoteDataSource());
  locator
      .registerSingleton<ICitySearchDataSource>(CitySearchRemoteDataSource());
}
