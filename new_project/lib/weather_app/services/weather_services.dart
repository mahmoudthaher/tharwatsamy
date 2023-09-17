import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:new_project/weather_app/models/weather_model.dart';

class WeatherServices {
  final Dio dio;

  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = '92f1b690dca14ff5940215609231009';

  WeatherServices(this.dio);

  Future<WeatherModel> getCrrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey%20&q=$cityName&days=1');
      WeatherModel weatherModel = WeatherModel.formJson(response.data);

      return weatherModel;
    } on DioException catch (e) {
      final String errMessage = e.response?.data['error']['message'] ??
          'oops there was an error , try later';
      throw Exception(errMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('oops there was an error , try later');
    }
  }
}
//اذا كان dio
// Future<dynamic> getCrrentWeather({required String cityName}) async {
//     Response response = await dio
//         .get('$baseUrl/forecast.json?key=$apiKey%20&q=$cityName&days=1');
//     return resposneFunction(response);
//   }

//   dynamic resposneFunction(Response response) {
//     switch (response.statusCode) {
//       case 200:
//       case 201:
//         WeatherModel weatherModel = WeatherModel.formJson(response.data);
//         return weatherModel;

//       case 400:
//         throw "Bad Request";
//       case 401:
//         throw "Unauthrizied";
//       case 402:
//         throw "Payment Required";
//       case 403:
//         throw "Forbidden";
//       case 404:
//         throw "Not Found";
//       case 500:
//         throw "Server Error :(";
//       default:
//         throw "Server Error :(";
//     }
//   }
