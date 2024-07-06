class WeatherModel {
  WeatherModel(
      {required this.averageTemp,
      required this.image,
      required this.cityName,
      required this.date,
      required this.minTemp,
      required this.maxTemp,
      required this.weatherStatus});

  final String cityName;
  final DateTime date;
  final String image;
  final double averageTemp;
  final double minTemp;
  final double maxTemp;
  final String weatherStatus;

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      image: json["forecast"]["forecastday"][0]["day"]["condition"]
      ["icon"],
        averageTemp: json["forecast"]["forecastday"][0]["day"]["avgtemp_c"],
        cityName: json["location"]["name"],
        date: DateTime.parse(json["current"]["last_updated"]),
        minTemp: json["forecast"]["forecastday"][0]["day"]["mintemp_c"],
        maxTemp: json["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
        weatherStatus: json["forecast"]["forecastday"][0]["day"]["condition"]
            ["text"]);
  }
}
