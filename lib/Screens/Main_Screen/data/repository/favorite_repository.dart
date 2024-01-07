import 'package:dartz/dartz.dart';
import 'package:wheather/Screens/Main_Screen/data/datasource/favorite_datasource.dart';
import 'package:wheather/Screens/Main_Screen/data/model/faforite_city_model.dart';
import 'package:wheather/di/di.dart';
import 'package:wheather/utils/Api_Exception.dart';
import 'package:wheather/utils/Db_Exception.dart';

abstract class ICityInfoRepository {
  Future<Either<String, city_info>> fetch_cityinfo_repository(String cityname);
  Future<Either<String, List<String>>> fetch_citesis_list_repository();
  Future<Either<String, List<city_info>>>
      fetch_favorite_cities_Info_repository();
  Future<void> delete_favorite_cities_Info_repository(String cityname);
}

class CityInforepository extends ICityInfoRepository {
  ICityInfoDataSource cityInfoDataSource = locator.get<ICityInfoDataSource>();
  @override
  Future<Either<String, city_info>> fetch_cityinfo_repository(
      String cityname) async {
    try {
      var response = await cityInfoDataSource
          .fetch_favorite_city_info_datasource(cityname);
      return right(response);
    } on ApiException catch (e) {
      return left(e.message ?? "no technical problem");
    } catch (e) {
      return left("no technical problem");
    }
  }

  @override
  Future<Either<String, List<String>>> fetch_citesis_list_repository() async {
    try {
      List<String> citeislist =
          await cityInfoDataSource.fetch_favorite_cities_db_datasource();
      return right(citeislist);
    } on DbException catch (e) {
      return left(e.message ?? "محتوای فنی نداری");
    } catch (e) {
      return left("محتوای فنی نداری");
    }
  }

  @override
  Future<Either<String, List<city_info>>>
      fetch_favorite_cities_Info_repository() async {
    try {
      List<city_info> citeislist =
          await cityInfoDataSource.fetch_favorite_cities_Info_datasource();
      return right(citeislist);
    } on ApiException catch (e) {
      return left(e.message ?? "no technical problem");
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<void> delete_favorite_cities_Info_repository(String cityname) async {
    try {
      await cityInfoDataSource.delete_favorite_city_Info_datasource(cityname);
    } on DbException catch (e) {
      print(e.toString());
    }
  }
}
