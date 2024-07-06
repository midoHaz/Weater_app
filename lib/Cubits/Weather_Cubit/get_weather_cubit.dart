import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import '../../models/weather_model.dart';
import '../../services/weather_services.dart';

part 'get_weather_state.dart';

class GetWeatherCubit extends Cubit<GetWeatherState> {
  GetWeatherCubit() : super(GetWeatherInitial());
   WeatherModel? weatherModel;
  getWeather({required String cityName})async{
    try{
      weatherModel= await WeatherService(Dio()).getWeatherData(place:cityName);
      emit(LoadedWeatherState(weatherModel!));
    }catch(e){
      emit(FailureWeatherState());
    }
  }
}
