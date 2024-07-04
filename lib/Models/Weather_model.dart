class WeatherModel {
  final String cityName;
  final DateTime date;
  final String img;
  final double avgTemp;
  final double maxTemp;
  final double minTemp;
  final String condition;
  final double precip;
  final double wind;
  final int humidity;

  WeatherModel({
    required this.cityName,
    required this.date,
    required this.img,
    required this.avgTemp,
    required this.maxTemp,
    required this.minTemp,
    required this.condition,
    required this.precip,
    required this.wind,
    required this.humidity,
  });

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      cityName: json['location']['name'],
      date: DateTime.parse(json['current']['last_updated']),
      img: json['forecast']['forecastday'][0]['day']['condition']['icon'],
      avgTemp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      condition: json['forecast']['forecastday'][0]['day']['condition']['text'],
      precip: json['current']['pressure_in'],
      wind: json['current']['wind_kph'],
      humidity: json['current']['humidity'],
    );
  }
}
