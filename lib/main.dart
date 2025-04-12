import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubit/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/functions/get_condition_color.dart';
import 'package:weather_app/screens/home_screen.dart';

Future<void> main() async {
  runApp(
    DevicePreview(
      enabled: true, // Set to false to disable it in production
      builder: (context) {
        return const MyApp();
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetWeatherCubit(),
      child: Builder(
        builder: (context) {
          return BlocBuilder<GetWeatherCubit, WeatherStates>(
            builder: (context, state) {
              String? condition;
              if (state is WeatherLoadedState) {
                condition = state.weather.condition;
              }

              final color = getConditionColor(condition: condition);

              return MaterialApp(
                theme: ThemeData(
                  primarySwatch: color,
                  appBarTheme: AppBarTheme(
                    backgroundColor: color,
                    foregroundColor: Colors.white,
                  ),
                ),
                builder: DevicePreview.appBuilder,
                debugShowCheckedModeBanner: false,
                home: const HomeScreen(),
              );
            },
          );
        },
      ),
    );
  }
}
