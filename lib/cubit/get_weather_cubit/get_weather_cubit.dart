import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherStates> {
  GetWeatherCubit() : super(InitialState());
  WeatherModel? weather;

  Future<void> getWeather(String cityName) async {
    try {
      // ✅ Don't pass a custom Dio here — let the service handle it internally
      weather = await WeatherService().fetchWeather(cityName);
      emit(WeatherLoadedState(weather: weather!));
    } catch (e) {
      emit(WeatherFaliureState(message: e.toString()));
    }
  }
}
