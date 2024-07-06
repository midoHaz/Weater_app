import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/views/HomeView.dart';

import 'Cubits/Weather_Cubit/get_weather_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => GetWeatherCubit(),
        child: Builder(builder: (context) {
          return BlocBuilder<GetWeatherCubit, GetWeatherState>(
            builder: (context, state) {
              return MaterialApp(
                theme: ThemeData(
                    primarySwatch: getThemeColor(
                        BlocProvider.of<GetWeatherCubit>(context)
                            .weatherModel
                            ?.weatherStatus)),
                debugShowCheckedModeBanner: false,
                home: const HomeView(),
              );
            },
          );
        }));
  }
}

MaterialColor getThemeColor(String? condition) {
  // Convert the condition to lowercase for case-insensitive matching
  print(condition);
  if (condition == null) {
    return Colors.blue;
  }
  condition = condition.toLowerCase();
  switch (condition) {
    case "sunny":
    case "clear":
      return Colors.orange;
    case "partly cloudy":
      return Colors.blue;
    case "cloudy":
    case "overcast":
      return Colors.grey;
    case "mist":
    case "fog":
    case "freezing fog":
      return Colors.grey;
    case "patchy rain possible":
    case "light drizzle":
    case "patchy light drizzle":
      return Colors.lightBlue;
    case "patchy snow possible":
    case "light snow":
    case "patchy light snow":
      return Colors.lightBlue;
    case "patchy sleet possible":
    case "light sleet":
    case "patchy light sleet":
      return Colors.lightBlue;
    case "patchy freezing drizzle possible":
    case "light freezing drizzle":
    case "patchy light freezing drizzle":
      return Colors.lightBlue;
    case "thundery outbreaks possible":
    case "patchy light rain with thunder":
    case "patchy light snow with thunder":
      return Colors.red;
    case "blowing snow":
    case "blizzard":
    case "ice pellets":
      return Colors.grey;
    case "patchy light rain":
    case "light rain":
    case "moderate rain at times":
    case "moderate rain":
      return Colors.lightGreen;
    case "heavy rain at times":
    case "heavy rain":
      return Colors.green;
    case "light freezing rain":
    case "moderate or heavy freezing rain":
      return Colors.lightBlue;
    case "light sleet":
    case "moderate or heavy sleet":
      return Colors.lightBlue;
    case "patchy moderate snow":
    case "moderate snow":
    case "patchy heavy snow":
    case "heavy snow":
      return Colors.blue;
    case "light rain shower":
    case "moderate or heavy rain shower":
    case "torrential rain shower":
      return Colors.lightGreen;
    case "light sleet showers":
    case "moderate or heavy sleet showers":
      return Colors.lightBlue;
    case "light snow showers":
    case "moderate or heavy snow showers":
      return Colors.blue;
    case "light showers of ice pellets":
    case "moderate or heavy showers of ice pellets":
      return Colors.blue;
    case "moderate or heavy rain with thunder":
      return Colors.red;
    case "moderate or heavy snow with thunder":
      return Colors.red;
    default:
      return Colors.grey;
  }
}
