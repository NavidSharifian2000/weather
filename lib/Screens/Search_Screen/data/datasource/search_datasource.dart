import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dio/dio.dart';
import 'package:sqflite/sqflite.dart';
import 'package:wheather/Screens/Main_Screen/data/datasource/favorite_datasource.dart';
import 'package:wheather/Screens/Main_Screen/data/model/faforite_city_model.dart';
import 'package:wheather/Screens/Search_Screen/data/model/faforite_city_model.dart';
import 'package:wheather/di/di.dart';
import 'package:wheather/utils/Api_Exception.dart';
import 'package:wheather/utils/Db_Exception.dart';
import 'package:wheather/utils/dio_config.dart';

abstract class ICitySearchDataSource {
  Future<List<city_name>> search_city_name_datasource(String city_name);
  Future<void> insert_city_name_db_datasource(String city_name);
}

class CitySearchRemoteDataSource extends ICitySearchDataSource {
  final dio_project _wdio = locator.get<dio_project>();

  @override
  Future<List<city_name>> search_city_name_datasource(String city_Name) async {
    List<city_name> allcities = [];
    try {
      var response = await _wdio.dio!
          .get(city_Name + "&appid=37cc48acaa650e1802b52bf4587fb294");
      city_name city = city_name.fromjson(response.data);
      allcities.add(city);
      return allcities;
    } on DioException catch (e) {
      print(e);
      if (e.error is SocketException) {
        throw ApiException(1, "not net");
      }
      if (e.response!.statusCode == 404) {
        throw ApiException(404, "city not found");
      }
      throw ApiException(0, "unknow error");
    } catch (e) {
      throw ApiException(0, "unknow error");
    }
  }

  @override
  Future<void> insert_city_name_db_datasource(String city_name) async {
    try {
      bool isexist = false;
      Database favorite_cities_db = locator.get<Database>();
      final ICityInfoDataSource _datasource =
          locator.get<ICityInfoDataSource>();
      List<String> favorite_cities =
          await _datasource.fetch_favorite_cities_db_datasource();
      print(favorite_cities);
      await Future.forEach(favorite_cities, (element) {
        if (element == city_name) {
          isexist = true;
        }
      });
      if (isexist == false) {
        favorite_cities_db.rawQuery(
            "INSERT  INTO cities (Name_city) VALUES (\'${city_name}\');");
      }
    } catch (e) {
      throw DbException(0, e.toString());
    }
  }
}
