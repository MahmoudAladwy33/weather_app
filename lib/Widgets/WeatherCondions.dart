import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Models/Weather_model.dart';
import 'package:weather_app/Widgets/Weathericon.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class Weathercondions extends StatelessWidget {
  const Weathercondions({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Weathericon(
              image: ('assets/images/prcip.png'),
              cond: 'Precipitation',
              value: weatherModel.precip,
            ),
            Weathericon(
              image: ('assets/images/hum.png'),
              cond: 'Humidity',
              value: weatherModel.humidity,
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Weathericon(
              image: ('assets/images/wind.png'),
              cond: 'Wind',
              value: weatherModel.wind,
            ),
            Weathericon(
              image: ('assets/images/sunset.png'),
              cond: 'SunSet',
              value: generateRandomNumber(10, 40),
            ),
          ],
        ),
      ],
    );
  }

  num generateRandomNumber(int min, int max) {
    final random = Random();
    return min + random.nextInt(max - min + 1);
  }
}
