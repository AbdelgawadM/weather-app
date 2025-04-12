import 'package:flutter/material.dart';

class NoWeather extends StatelessWidget {
  const NoWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'there is No weather to show, please search ',
        style: TextStyle(fontSize: 35),
      ),
    );
  }
}
