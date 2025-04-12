import 'package:flutter/material.dart';

MaterialColor getConditionColor({required String? condition}) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition.toLowerCase()) {
    case 'clear':
      return Colors.blue; // Clear skies, Blue shade
    case 'partly cloudy':
    case 'sunny':
      return Colors.orange; // Partly cloudy, Orange shade
    case 'cloudy':
      return Colors.grey; // Cloudy, Grey shade
    case 'rain':
      return Colors.blueGrey; // Rain, BlueGrey shade
    case 'thunderstorm':
      return Colors.deepPurple; // Thunderstorm, DeepPurple shade
    case 'snow':
      return Colors.blueGrey; // Snow, BlueGrey shade
    case 'fog':
      return Colors.indigo; // Foggy, Indigo shade
    case 'mist': // Mist, Teal shade
    case 'overcast':
      return Colors
          .teal; // Overcast, using black with opacity for similar effect
    default:
      return Colors.blue; // Default case, Blue shade
  }
}
