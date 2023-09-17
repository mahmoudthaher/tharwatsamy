import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:new_project/weather_app/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:new_project/weather_app/models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          BlocProvider.of<GetWeatherCubit>(context).getThemeColor(),
          BlocProvider.of<GetWeatherCubit>(context).getThemeColor()[300]!,
          BlocProvider.of<GetWeatherCubit>(context).getThemeColor()[50]!,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      )),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherModel.cityName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            Text(
              'updated at ${weatherModel.date.hour}:${weatherModel.date.minute}',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.network(
                    'https:${weatherModel.image}',
                  ),
                ),
                Text(
                  ' ${weatherModel.temp.toInt()}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('max Temp :${weatherModel.maxTemp.toInt()}'),
                    Text('min Temp :${weatherModel.minTemp.toInt()}'),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              weatherModel.weatherStateName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// DateTime stringToDateTime(String vlaue) {
//   return DateTime.parse(vlaue);
// }
