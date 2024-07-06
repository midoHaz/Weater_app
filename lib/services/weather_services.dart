import 'package:dio/dio.dart';

import '../models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = "http://api.weatherapi.com/v1";
  final String apiKey = "6a7649ae88214dc3ac8121152231409";

  WeatherService(this.dio);

  Future<WeatherModel> getWeatherData({required String place}) async {
    try {
      var response = await dio.get(
          '$baseUrl/forecast.json?key=$apiKey&q=$place&day=1');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch(e){
      final String errorMessage =e.response?.data["error"]["message"] ??"Oops there was an error ,try later";
     throw  Exception(errorMessage);
    }catch(e){
      throw Exception("Oops there was an error ,try later");
    }
  }
}