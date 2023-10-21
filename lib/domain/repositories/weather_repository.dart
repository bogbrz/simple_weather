import 'package:simple_weather/data/remote_data_sources/weather_remote_data_source.dart';
import 'package:simple_weather/domain/models/weather_model.dart';

//http://api.weatherapi.com/v1/current.json?key=4fcc13713b1e463188974528232010&q=Poznan&aqi=no

class WeatherRepository {
  WeatherRepository(this._weatherRemoteDataSource);
  final WeatherRemoteDataSource _weatherRemoteDataSource;

  Future<WeatherModel?> getWeatherData({
    required String city,
  }) async {
    final json = await _weatherRemoteDataSource.getWeatherModel(city: city);
    if (json == null) {
      return null;
    }

    return WeatherModel.fromJson(json);
  }
}
