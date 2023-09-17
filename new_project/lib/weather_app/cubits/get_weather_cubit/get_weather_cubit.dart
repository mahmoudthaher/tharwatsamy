import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/weather_app/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:new_project/weather_app/models/weather_model.dart';
import 'package:new_project/weather_app/services/weather_services.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(WeatherInitialState());

  WeatherModel? weatherModel;
  getWeather({required String cityName}) async {
    try {
      emit(WeatherLodingState());
      weatherModel =
          await WeatherServices(Dio()).getCrrentWeather(cityName: cityName);
      emit(WeatherSuccessState());
    } on Exception catch (e) {
      emit(WeatherFailuerState());
    }
  }

  MaterialColor getThemeColor() {
    if (weatherModel!.weatherStateName == 'Sunny' ||
        weatherModel!.weatherStateName == 'Clear' ||
        weatherModel!.weatherStateName == 'partly cloudy') {
      return Colors.orange;
    } else if (weatherModel!.weatherStateName == 'Blizzard' ||
        weatherModel!.weatherStateName == 'Patchy snow possible' ||
        weatherModel!.weatherStateName == 'Patchy sleet possible' ||
        weatherModel!.weatherStateName == 'Patchy freezing drizzle possible' ||
        weatherModel!.weatherStateName == 'Blowing snow') {
      return Colors.blue;
    } else if (weatherModel!.weatherStateName == 'Freezing fog' ||
        weatherModel!.weatherStateName == 'Fog' ||
        weatherModel!.weatherStateName == 'Heavy Cloud' ||
        weatherModel!.weatherStateName == 'Mist' ||
        weatherModel!.weatherStateName == 'Fog') {
      return Colors.blueGrey;
    } else if (weatherModel!.weatherStateName == 'Patchy rain possible' ||
        weatherModel!.weatherStateName == 'Heavy Rain' ||
        weatherModel!.weatherStateName == 'Showers	') {
      return Colors.blue;
    } else if (weatherModel!.weatherStateName ==
            'Thundery outbreaks possible' ||
        weatherModel!.weatherStateName ==
            'Moderate or heavy snow with thunder' ||
        weatherModel!.weatherStateName == 'Patchy light snow with thunder' ||
        weatherModel!.weatherStateName ==
            'Moderate or heavy rain with thunder' ||
        weatherModel!.weatherStateName == 'Patchy light rain with thunder') {
      return Colors.deepPurple;
    } else {
      return Colors.orange;
    }
  }
}
