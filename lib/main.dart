import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Views/Homepage.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather-states.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return const MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Homepage(),
              
            );
          },
        ),
        
      ),
    );
  }
}

Image getImg(String? condition) {
  if (condition == null) {
    return Image.asset('assets/images/lightening.png');
  }
  switch (condition) {
    case 'Sunny':
    case 'Clear':
      return Image.asset(
        'assets/images/sunny.png',
        fit: BoxFit.cover,
      );

    case 'Partly cloudy':
    case 'Cloudy':
    case 'Overcast':
      return Image.asset('assets/images/cloudy.png');

    case 'Mist':
    case 'Fog':
    case 'Freezing fog':
      return Image.asset('assets/images/cloudy.png');

    case 'Patchy rain possible':
    case 'Patchy rain nearby':
    case 'Patchy light drizzle':
    case 'Light drizzle':
    case 'Patchy light rain':
    case 'Light rain':
    case 'Moderate rain at times':
    case 'Moderate rain':
    case 'Heavy rain at times':
    case 'Heavy rain':
    case 'Moderate or heavy rain shower':
    case 'Torrential rain shower':
    case 'Patchy light rain with thunder':
    case 'Moderate or heavy rain with thunder':
      return Image.asset('assets/images/rain+sunny.png');

    case 'Patchy moderate snow':
    case 'Moderate snow':
    case 'Patchy light snow with thunder':
    case 'Moderate or heavy snow with thunder':
    case 'Patchy snow possible':
    case 'Patchy sleet possible':
    case 'Patchy freezing drizzle possible':
    case 'Blowing snow':
    case 'Freezing drizzle':
    case 'Heavy freezing drizzle':
    case 'Light freezing rain':
    case 'Moderate or heavy freezing rain':
    case 'Light sleet':
    case 'Moderate or heavy sleet':
    case 'Patchy heavy snow':
    case 'Heavy snow':
    case 'Ice pellets':
    case 'Light sleet showers':
    case 'Moderate or heavy sleet showers':
    case 'Light showers of ice pellets':
    case 'Moderate or heavy showers of ice pellets':
      return Image.asset('assets/images/clouds+snow.png');

    case 'Thundery outbreaks possible':
    case 'Thunderstorm':
    case 'Light thunderstorm':
    case 'Heavy thunderstorm':
      return Image.asset('assets/images/lightening.png');

    default:
      return Image.asset('assets/images/cloudy+sunny.png');
  }
}
