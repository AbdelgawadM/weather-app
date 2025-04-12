import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubit/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/screens/search_screen.dart';
import 'package:weather_app/widgets/no_weather.dart';
import 'package:weather_app/widgets/weather_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchScreen()),
              );
            },
            icon: Icon(size: 30, Icons.search),
          ),
        ],
        centerTitle: false,
        title: Text(
          'weather App',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),

      body: BlocBuilder<GetWeatherCubit, WeatherStates>(
        builder: (context, state) {
          if (state is WeatherLoadedState) {
            return WeatherWidget(
              cityName: state.weather.cityName,
              date: state.weather.date,
              image: state.weather.image,
              condition: state.weather.condition,
              minTemp: state.weather.minTemp,
              maxTemp: state.weather.maxTemp,
              avgTemp: state.weather.averageTemp,
            );
          } else if (state is InitialState) {
            return NoWeather();
          } else if (state is WeatherFaliureState) {
            return Center(child: Text("Error: ${state.message}"));
          } else if (state is WeatherLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Center(child: Text(';dfghjhgfdsasdfghjkjhgfdx'));
          }
        },
      ),
    );
  }
}
