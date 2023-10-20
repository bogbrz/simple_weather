class WeatherModel {
  const WeatherModel({
    required this.temperature,
    required this.city,
  });

  final double temperature;
  final String city;

  WeatherModel.fromJson(Map<String, dynamic> json)
      : temperature = json['current']['temp_c'],
        city = json['location']['name'];
}
