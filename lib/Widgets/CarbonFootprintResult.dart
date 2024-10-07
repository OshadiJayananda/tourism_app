import 'package:flutter/material.dart';

class CarbonFootprintResult extends StatelessWidget {
  final String resultMessage; // You can pass parameters as needed

  // Constructor to receive parameters
  const CarbonFootprintResult({super.key, required this.resultMessage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Carbon Footprint Result"),
      ),
      body: Center(
        child: Text(
          resultMessage, // Display the result message
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
