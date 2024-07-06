part of 'get_weather_cubit.dart';

@immutable
abstract class GetWeatherState {}

class GetWeatherInitial extends GetWeatherState {
}

class LoadedWeatherState extends GetWeatherState {
  final WeatherModel weatherModel;

  LoadedWeatherState(this.weatherModel);

}
class FailureWeatherState extends GetWeatherState {
}
