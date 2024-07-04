import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Models/Weather_model.dart';
import 'package:weather_app/Widgets/GradientText.dart';
import 'package:weather_app/Widgets/WeatherCondions.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/main.dart';

class Weatherinfobody extends StatelessWidget {
  const Weatherinfobody({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xff304463),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 28,
                ),
                Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 28, 42, 63),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: Text(
                      ('Updated at ${weatherModel.date.hour} :${weatherModel.date.minute} '),
                      style: const TextStyle(
                        fontSize: 20,
                        color: Color(0xff9B9EAD),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  weatherModel.cityName,
                  style: const TextStyle(
                    color: Colors.orange,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    SizedBox(
                      child: getImg(weatherModel.condition),
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GradientText(
                              weatherModel.avgTemp.round().toString(),
                              style: const TextStyle(
                                height: 0,
                                fontSize: 100,
                                fontWeight: FontWeight.bold,
                              ),
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xffA2A4B5),
                                  Color(0xff545760),
                                ],
                              ),
                            ),
                            const Text(
                              '°',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          weatherModel.condition,
                          style: const TextStyle(
                            height: 0,
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 60,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(
                            text: 'Maxtemp: ',
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xff9B9EAD),
                            ),
                          ),
                          TextSpan(
                            text: '${weatherModel.maxTemp.round()}',
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    const Text(
                      '|',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(
                            text: 'Mintemp: ',
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xff9B9EAD),
                            ),
                          ),
                          TextSpan(
                            text: '${weatherModel.minTemp.round()}',
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 80,
                ),
                const Weathercondions(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
