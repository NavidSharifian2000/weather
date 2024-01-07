import 'package:dio/dio.dart';

class dio_project {
  Dio? dio;
}

class wheather_dio extends dio_project {
  Dio? dio;
  wheather_dio() {
    dio = Dio(BaseOptions(
        baseUrl: "https://api.openweathermap.org/data/2.5/weather?q="));
  }
}
