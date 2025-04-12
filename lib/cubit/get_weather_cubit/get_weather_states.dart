import 'package:weather_app/models/weather_model.dart';

class WeatherStates {}

class InitialState extends WeatherStates {}

class WeatherLoadingState extends WeatherStates {}

class WeatherLoadedState extends WeatherStates {
  final WeatherModel weather;

  WeatherLoadedState({required this.weather});
}

class WeatherFaliureState extends WeatherStates {
  final String message;

  WeatherFaliureState({required this.message});
}
