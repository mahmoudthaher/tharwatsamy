import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:new_project/weather_app/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:new_project/weather_app/models/weather_model.dart';
import 'package:new_project/weather_app/views/search_view.dart';
import 'package:new_project/weather_app/widgets/no_weather_body.dart';
import 'package:new_project/weather_app/widgets/weather_info_body.dart';

class WeatherHomeApp extends StatelessWidget {
  const WeatherHomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Weather App'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SearchView(),
                      ));
                },
                icon: const Icon(
                  Icons.search,
                  size: 30,
                ))
          ],
        ),
        body: BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is WeatherLodingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is WeatherSuccessState) {
              return WeatherInfoBody();
            } else if (state is WeatherFailuerState) {
              return const Center(
                  child: Text('opps there was an error',
                      style: TextStyle(fontSize: 25)));
            } else
              return NoWeatherBody();
          },
        ));
  }
}
