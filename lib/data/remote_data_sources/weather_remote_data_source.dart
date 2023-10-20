import 'package:dio/dio.dart';
import 'package:simple_weather/domain/models/weather_model.dart';

//http://api.weatherapi.com/v1/current.json?key=4fcc13713b1e463188974528232010&q=Poznan&aqi=no

class WeatherRemoteDataSource {
  Future<Map<String, dynamic>?> getWeatherModel({
    required String city,
  }) async {
    //przychodzące dane z Dio są typu dynamic i musimy zmienić je na Map<String,dynamic>
    final respone = await Dio().get<Map<String, dynamic>>(
        'http://api.weatherapi.com/v1/current.json?key=4fcc13713b1e463188974528232010&q=$city&aqi=no');

    return respone.data;
  }
}
