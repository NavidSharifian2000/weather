import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:wheather/Screens/Main_Screen/bloc/favorite_event.dart';
import 'package:wheather/Screens/Main_Screen/bloc/favorite_state.dart';
import 'package:wheather/Screens/Main_Screen/data/model/faforite_city_model.dart';
import 'package:wheather/Screens/Main_Screen/data/repository/favorite_repository.dart';
import 'package:wheather/di/di.dart';

class CityInfoBloc extends Bloc<CityInfoEvent, CityinfoState> {
  ICityInfoRepository _repository = locator.get();
  CityInfoBloc() : super(CityInfoInitState()) {
    on<CityInfogetdataEvent>(
      (event, emit) async {
        emit(CityInfoLoadingState());
        Either<String, List<city_info>> city_info_list =
            await _repository.fetch_favorite_cities_Info_repository();
        emit(CityInfossuccessState(city_info_list));
      },
    );
    on<CityInfodeletedataEvent>(
      (event, emit) async {
        emit(CityInfoLoadingState());
        await _repository
            .delete_favorite_cities_Info_repository(event.cityname);
        Either<String, List<city_info>> city_info_list =
            await _repository.fetch_favorite_cities_Info_repository();
        emit(CityInfossuccessState(city_info_list));
      },
    );
  }
}
