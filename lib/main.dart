import 'package:flutter/material.dart';

import 'my_home_page.dart';

void main() {
  runApp(const FuelTravel());
}

class FuelTravel extends StatefulWidget {
  const FuelTravel({super.key});

  @override
  State<FuelTravel> createState() => _FuelTravelState();
}

class _FuelTravelState extends State<FuelTravel> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
