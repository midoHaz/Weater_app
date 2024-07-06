import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Cubits/Weather_Cubit/get_weather_cubit.dart';

class SearchPlace extends StatelessWidget {
  const SearchPlace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search A city"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: TextFormField(
            onFieldSubmitted: (value)async {
              var getWeather = BlocProvider.of<GetWeatherCubit>(context);
              getWeather.getWeather(cityName: value);
              Navigator.pop(context);
            },
            keyboardType: TextInputType.text,
            decoration:  InputDecoration(
              labelText: "Search",
              hintText: "Enter city name",
              suffixIcon: IconButton(onPressed: (){

              }, icon:const  Icon(Icons.search_rounded),color: Colors.grey,),
              border: OutlineInputBorder(
                borderSide: const BorderSide(width: 1.0,color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ),
    );
}
}