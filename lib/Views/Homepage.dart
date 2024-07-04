import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Widgets/NoWeatherBody.dart';
import 'package:weather_app/Views/SearchView.dart';
import 'package:weather_app/Widgets/WeatherInfoBody.dart';
import 'package:weather_app/Widgets/circular.dart';
import 'package:weather_app/Widgets/errMsg.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather-states.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:const Color(0xff304463),
        centerTitle: true,
        title:const Text(
          'Weather App',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon:const Icon(
              Icons.search,
              size: 30,
              color: Colors.orange,
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const Searchview();
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitialState) {
            return const Noweatherbody();
          } else if (state is WeatherLoadedState) {
            return const Weatherinfobody();
          } else if (state is WeatherLoadingState) {
            return const Circular();
          } else {
            return const Errmsg();
          }
        },
      ),
    );
  }
}
