import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class Searchview extends StatelessWidget {
  const Searchview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon:const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor:const Color(0xff304463),
        title:const Text(
          'Search a city',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body:
       Container(
        decoration:const BoxDecoration(
          color: Color(0xff304463),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: TextField(
              style:const TextStyle(
                color: Colors.white,
              ),
              onSubmitted: (value) {
                var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
                getWeatherCubit.getWeather(cityName: value);
                Navigator.of(context).pop();
              },
              decoration: InputDecoration(
                contentPadding:const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 32,
                ),
                labelText: 'Search',
                labelStyle:const TextStyle(
                  color: Colors.white,
                ),
                hintText: 'Enter City Name',
                hintStyle:const TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.normal,
                ),
                suffixIcon:const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:const BorderSide(
                    color: Colors.orange,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:const BorderSide(
                    color: Colors.orange,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
