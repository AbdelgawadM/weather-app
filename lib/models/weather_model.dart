class WeatherModel {
  final String cityName;
  final String image;
  final String condition;
  final DateTime date;
  final double minTemp;
  final double maxTemp;
  final double averageTemp;

  WeatherModel({
    required this.cityName,
    required this.image,
    required this.condition,
    required this.date,
    required this.minTemp,
    required this.maxTemp,
    required this.averageTemp,
  });
  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    final location = json['location'];
    final forecastDay = json['forecast']['forecastday'][0];
    final day = forecastDay['day'];

    return WeatherModel(
      cityName: location['name'],
      minTemp: day['mintemp_c'].toDouble(),
      maxTemp: day['maxtemp_c'].toDouble(),
      averageTemp: day['avgtemp_c'].toDouble(),
      image: "https:${day['condition']['icon']}",
      condition: day['condition']['text'],
      date: DateTime.parse(json['current']['last_updated']),
    );
  }
}
