import 'package:flutter/material.dart';

class CarbonFootprintResult extends StatelessWidget {
  final String resultMessage; // You can pass parameters as needed

  // Constructor to receive parameters
  CarbonFootprintResult({Key? key, required this.resultMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carbon Footprint Result"),
      ),
      body: Center(
        child: Text(
          resultMessage, // Display the result message
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
