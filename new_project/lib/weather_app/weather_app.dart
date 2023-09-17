// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:new_project/weather_app/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:new_project/weather_app/models/weather_model.dart';
import 'package:new_project/weather_app/views/weather_home_page.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) {
          return BlocBuilder<GetWeatherCubit, WeatherState>(
            builder: (context, state) {
              return MaterialApp(
                theme: ThemeData(
                    primarySwatch: BlocProvider.of<GetWeatherCubit>(context)
                                .weatherModel ==
                            null
                        ? Colors.blue
                        : BlocProvider.of<GetWeatherCubit>(context)
                            .getThemeColor()),
                debugShowCheckedModeBanner: false,
                home: WeatherHomeApp(),
              );
            },
          );
        },
      ),
    );
  }
}
