import 'package:dio/dio.dart';

class RemoteDataSource {
  RemoteDataSource();

  Future<Map<String, dynamic>?> getWeatherData({required String city}) async {
    try {
      final respone = await Dio().get<Map<String, dynamic>>(
          'http://api.weatherapi.com/v1/current.json?key=e59a4a4b805c43f58f1164956231511&q=$city&aqi=yes');

      return respone.data;
    } on DioException catch (error) {
      throw Exception(
          error.response?.data['error']['message'] ?? "unknown error");
    }
  }
}
