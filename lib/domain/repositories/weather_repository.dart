import 'package:simple_weather/data/remote_data_sources/remote_data_source.dart';
import 'package:simple_weather/domain/models/weather_model.dart';

class WeatherRepository {
  WeatherRepository({required this.remoteDataSource});
  final RemoteDataSource remoteDataSource;
  Future<WeatherModel?> getWeatherModel({
    required String city,
  }) async {
    final json = await remoteDataSource.getWeatherData(city: city);
    if (json == null) {
      return null;
    }
    return WeatherModel.fromJson(json);
  }
}
