import 'package:flutter/material.dart';

class CarbonResults extends StatelessWidget {
  final double emissions;
  final String pickupLocation;
  final String dropOffLocation;
  final String travelMode;

  CarbonResults({
    required this.emissions,
    required this.pickupLocation,
    required this.dropOffLocation,
    required this.travelMode,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Carbon Emission Results', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Carbon Emission Calculation Result',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.teal.shade700),
            ),
            SizedBox(height: 20),

            // Display results
            Text(
              'Pickup Location: $pickupLocation',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Drop-off Location: $dropOffLocation',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Travel Mode: $travelMode',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),

            // Display carbon emissions
            Text(
              'Total Carbon Emissions: ${emissions.toStringAsFixed(2)} kg CO2',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.redAccent),
            ),
            SizedBox(height: 20),

            // Suggestion or impact information
            Text(
              'Consider using public transport or a bicycle to reduce your carbon footprint.',
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic, color: Colors.teal),
            ),
          ],
        ),
      ),
    );
  }
}
