
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/main.dart';
import 'package:weather/models/weather_model.dart';
import '../Cubits/Weather_Cubit/get_weather_cubit.dart';
import '../widgets/no_weather_data.dart';
import '../widgets/weather_data.dart';
import 'search_place.dart';
class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App",),
        actions: [IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const SearchPlace()));
        }, icon:const  Icon(Icons.search_rounded))],
      ),
      body: BlocBuilder<GetWeatherCubit,GetWeatherState>(
        builder: (context, state) {
         if(state is GetWeatherInitial){
           return const NoWeatherData();
         }else if(state is LoadedWeatherState){
           return WeatherInfoBody(weather: state.weatherModel,);
         }else{
           return const Center(child: Text("Oops there was an error"));
         }
        },
      ),
    );
  }
}
