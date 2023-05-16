import 'package:flutter/material.dart';

class TravelCost extends StatefulWidget {
  const TravelCost({super.key});

  @override
  State<TravelCost> createState() => _TravelCostState();
}

class _TravelCostState extends State<TravelCost> {
  final fuelController = TextEditingController();
  final literController = TextEditingController();
  final tripController = TextEditingController();

  String infotext = 'Para calcular informe os valores!';

  travelCalculate() {
    double fuel = double.parse(fuelController.text);
    double liter = double.parse(literController.text);
    double trip = double.parse(tripController.text);

    final result = (fuel / liter) * trip;

    setState(() {
      if (fuel.toString().isEmpty) {
        infotext = 'Faltou algum valor, Informe todos os valores!';
      } else {
        infotext = 'Você ira gastar o valor de ${result.toStringAsFixed(2)}';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Icon(
            Icons.luggage,
            size: 150,
            color: Colors.black,
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Preço Combustível',
              labelStyle: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              icon: Icon(
                Icons.local_gas_station,
                color: Color.fromARGB(255, 0, 0, 0),
                size: 40,
              ),
            ),
            keyboardType: TextInputType.number,
            controller: fuelController,
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Km por litro',
              labelStyle: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              icon: Icon(
                Icons.directions_car_filled,
                color: Colors.black,
                size: 40,
              ),
            ),
            keyboardType: TextInputType.number,
            controller: literController,
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Km da Viagem',
              labelStyle: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              icon: Icon(
                Icons.location_on,
                color: Colors.black,
                size: 40,
              ),
            ),
            keyboardType: TextInputType.number,
            controller: tripController,
          ),
          ElevatedButton(
            onPressed: travelCalculate,
            style: ElevatedButton.styleFrom(
                minimumSize: const Size(150, 40),
                backgroundColor: const Color.fromARGB(255, 0, 0, 0)),
            child: const Text(
              'Calcular',
              style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            infotext,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          )
        ],
      ),
    );
  }
}
