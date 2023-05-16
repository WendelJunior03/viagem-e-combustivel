import 'package:custokm/screens/first_screen.dart';
import 'package:custokm/screens/fuel_price.dart';
import 'package:custokm/screens/travel_cost.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final fuelController = TextEditingController();
  final literController = TextEditingController();
  final tripController = TextEditingController();

  String infotext = 'Informe todos os valores!';

  resetState() {
    fuelController.text = '';
    literController.text = '';
    tripController.text = '';
    setState(() {
      infotext = 'Informe todos os valores';
      _currentIndex = 0;
    });
  }

  int _currentIndex = 0;

  final List<Widget> _children = [
    const FirstScreen(),
    const TravelCost(),
    const FuelPrice(),
  ];
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: const Text(
          'COMBUSTIVEL E VIAGEM',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        actions: [
          IconButton(
            onPressed: resetState,
            icon: const Icon(Icons.refresh),
            color: const Color.fromARGB(255, 255, 255, 255),
          ),
        ],
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: const Color.fromARGB(255, 0, 0, 0),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        elevation: 25,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.luggage),
            label: 'Custo da viagem',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_gas_station),
            label: 'Preço combustivel',
          ),
        ],
      ),
    );
  }
}
