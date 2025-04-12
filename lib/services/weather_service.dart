import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio _dio;

  WeatherService({Dio? dio})
    : _dio = dio ?? Dio(BaseOptions(baseUrl: 'https://api.weatherapi.com/v1/'));

  Future<WeatherModel> fetchWeather(String cityName) async {
    try {
      final response = await _dio.get(
        'forecast.json',
        queryParameters: {
          'key': '6d2f39ba55864f74abd172046250604', // Replace with your API key
          'q': cityName,
          'days': 1,
          'aqi': 'no',
          'alerts': 'no',
        },
      );

      if (response.statusCode == 200) {
        return WeatherModel.fromJson(response.data);
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      throw Exception('Error fetching weather: $e');
    }
  }
}
