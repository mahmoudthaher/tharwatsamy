import 'package:new_project/weather_app/models/weather_model.dart';

abstract class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherLodingState extends WeatherState {}

class WeatherSuccessState extends WeatherState {
  WeatherSuccessState();
}

class WeatherFailuerState extends WeatherState {}
