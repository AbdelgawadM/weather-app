import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/functions/get_condition_color.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({
    super.key,
    required this.cityName,
    required this.date,
    required this.image,
    required this.condition,
    required this.minTemp,
    required this.maxTemp,
    required this.avgTemp,
  });
  final String cityName, image, condition;
  final double minTemp, maxTemp, avgTemp;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weather!;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            getConditionColor(condition: weatherModel.condition),
            getConditionColor(condition: weatherModel.condition).shade200,
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Text(
            cityName,
            style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
          ),
          Text(
            'updated at ${date.hour}:${date.minute}',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 80,
                width: 80,
                child: Image(image: NetworkImage(image)),
              ),
              Text(
                '${avgTemp.round()}',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              Column(
                children: [
                  Text(
                    'Max Temp: ${maxTemp.round()}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'Min Temp: ${minTemp.round()}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 30),

          Text(
            condition,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
