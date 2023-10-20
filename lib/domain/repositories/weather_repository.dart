import 'package:dio/dio.dart';
import 'package:simple_weather/data/remote_data_sources/weather_remote_data_source.dart';
import 'package:simple_weather/domain/models/weather_model.dart';

//http://api.weatherapi.com/v1/current.json?key=4fcc13713b1e463188974528232010&q=Poznan&aqi=no

class WeatherRepository {
  WeatherRepository(this._weatherRemoteDataSource);
  final WeatherRemoteDataSource _weatherRemoteDataSource;

  Future<WeatherModel?> getWeatherData({
    required String city,
  }) async {
    final responseData =
        await _weatherRemoteDataSource.getWeatherModel(city: city);
    if (responseData == null) {
      return null;
    }

    final name = responseData['location']['name'] as String;
    final temperature = (responseData['current']['temp_c']) as double;

    print(temperature);
    print(name);

    return WeatherModel(city: name, temperature: temperature);
  }
}
