import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'carbonresults.dart'; // Import your results page here

class CarbonFootprintCalculator extends StatefulWidget {
  const CarbonFootprintCalculator({super.key});

  @override
  _CarbonFootprintCalculatorState createState() =>
      _CarbonFootprintCalculatorState();
}

class _CarbonFootprintCalculatorState extends State<CarbonFootprintCalculator> {
  final _formKey = GlobalKey<FormState>();
  String? pickupLocation;
  String? dropOffLocation;
  String? travelMode;
  double distance = 0.0; // Distance in kilometers
  final List<String> locations = [
    'Ampara',
    'Anuradhapura',
    'Badulla',
    'Batticaloa',
    'Colombo',
    'Galle',
    'Gampaha',
    'Hambantota',
    'Jaffna',
    'Kalutara',
    'Kandy',
    'Kegalle',
    'Kilinochchi',
    'Kurunegala',
    'Mannar',
    'Matale',
    'Matara',
    'Moneragala',
    'Mullaitivu',
    'Nuwara Eliya',
    'Polonnaruwa',
    'Puttalam',
    'Ratnapura',
    'Trincomalee',
    'Vavuniya'
  ];

  final Map<String, Map<String, double>> locationDistances = {
'Ampara': {
    'Anuradhapura': 205,
    'Badulla': 150,
    'Batticaloa': 120,
    'Colombo': 330,
    'Galle': 385,
    'Gampaha': 340,
    'Hambantota': 210,
    'Jaffna': 360,
    'Kalutara': 370,
    'Kandy': 225,
    'Kegalle': 280,
    'Kilinochchi': 320,
    'Kurunegala': 290,
    'Mannar': 390,
    'Matale': 260,
    'Matara': 350,
    'Moneragala': 100,
    'Mullaitivu': 250,
    'Nuwara Eliya': 220,
    'Polonnaruwa': 100,
    'Puttalam': 350,
    'Ratnapura': 260,
    'Trincomalee': 220,
    'Vavuniya': 310
  },
  'Anuradhapura': {
    'Ampara': 205,
    'Badulla': 180,
    'Batticaloa': 250,
    'Colombo': 206,
    'Galle': 250,
    'Gampaha': 220,
    'Hambantota': 310,
    'Jaffna': 270,
    'Kalutara': 250,
    'Kandy': 180,
    'Kegalle': 150,
    'Kilinochchi': 120,
    'Kurunegala': 160,
    'Mannar': 230,
    'Matale': 130,
    'Matara': 310,
    'Moneragala': 160,
    'Mullaitivu': 140,
    'Nuwara Eliya': 160,
    'Polonnaruwa': 60,
    'Puttalam': 220,
    'Ratnapura': 190,
    'Trincomalee': 110,
    'Vavuniya': 150
  },
  'Badulla': {
    'Ampara': 150,
    'Anuradhapura': 180,
    'Batticaloa': 180,
    'Colombo': 230,
    'Galle': 290,
    'Gampaha': 250,
    'Hambantota': 140,
    'Jaffna': 250,
    'Kalutara': 270,
    'Kandy': 114,
    'Kegalle': 140,
    'Kilinochchi': 260,
    'Kurunegala': 190,
    'Mannar': 250,
    'Matale': 120,
    'Matara': 240,
    'Moneragala': 50,
    'Mullaitivu': 220,
    'Nuwara Eliya': 40,
    'Polonnaruwa': 190,
    'Puttalam': 290,
    'Ratnapura': 150,
    'Trincomalee': 220,
    'Vavuniya': 290
  },
  'Batticaloa': {
    'Ampara': 120,
    'Anuradhapura': 250,
    'Badulla': 180,
    'Colombo': 320,
    'Galle': 390,
    'Gampaha': 340,
    'Hambantota': 250,
    'Jaffna': 300,
    'Kalutara': 340,
    'Kandy': 260,
    'Kegalle': 270,
    'Kilinochchi': 230,
    'Kurunegala': 290,
    'Mannar': 320,
    'Matale': 250,
    'Matara': 310,
    'Moneragala': 110,
    'Mullaitivu': 200,
    'Nuwara Eliya': 270,
    'Polonnaruwa': 200,
    'Puttalam': 350,
    'Ratnapura': 230,
    'Trincomalee': 70,
    'Vavuniya': 260
  },
  'Colombo': {
    'Ampara': 330,
    'Anuradhapura': 206,
    'Badulla': 230,
    'Batticaloa': 320,
    'Galle': 116,
    'Gampaha': 30,
    'Hambantota': 230,
    'Jaffna': 400,
    'Kalutara': 40,
    'Kandy': 115,
    'Kegalle': 60,
    'Kilinochchi': 340,
    'Kurunegala': 80,
    'Mannar': 390,
    'Matale': 160,
    'Matara': 160,
    'Moneragala': 130,
    'Mullaitivu': 350,
    'Nuwara Eliya': 180,
    'Polonnaruwa': 150,
    'Puttalam': 90,
    'Ratnapura': 100,
    'Trincomalee': 240,
    'Vavuniya': 310
  },
  'Galle': {
    'Ampara': 385,
    'Anuradhapura': 250,
    'Badulla': 290,
    'Batticaloa': 390,
    'Colombo': 116,
    'Gampaha': 150,
    'Hambantota': 40,
    'Jaffna': 440,
    'Kalutara': 120,
    'Kandy': 200,
    'Kegalle': 180,
    'Kilinochchi': 400,
    'Kurunegala': 210,
    'Mannar': 480,
    'Matale': 220,
    'Matara': 40,
    'Moneragala': 320,
    'Mullaitivu': 400,
    'Nuwara Eliya': 270,
    'Polonnaruwa': 270,
    'Puttalam': 300,
    'Ratnapura': 200,
    'Trincomalee': 320,
    'Vavuniya': 440
  },
  'Gampaha': {
    'Ampara': 340,
    'Anuradhapura': 220,
    'Badulla': 250,
    'Batticaloa': 340,
    'Colombo': 30,
    'Galle': 150,
    'Hambantota': 300,
    'Jaffna': 410,
    'Kalutara': 50,
    'Kandy': 90,
    'Kegalle': 30,
    'Kilinochchi': 340,
    'Kurunegala': 70,
    'Mannar': 400,
    'Matale': 180,
    'Matara': 290,
    'Moneragala': 240,
    'Mullaitivu': 350,
    'Nuwara Eliya': 210,
    'Polonnaruwa': 200,
    'Puttalam': 90,
    'Ratnapura': 150,
    'Trincomalee': 270,
    'Vavuniya': 360
  },
  'Hambantota': {
    'Ampara': 210,
    'Anuradhapura': 310,
    'Badulla': 140,
    'Batticaloa': 250,
    'Colombo': 230,
    'Galle': 40,
    'Gampaha': 300,
    'Jaffna': 380,
    'Kalutara': 230,
    'Kandy': 220,
    'Kegalle': 150,
    'Kilinochchi': 320,
    'Kurunegala': 200,
    'Mannar': 360,
    'Matale': 270,
    'Matara': 60,
    'Moneragala': 180,
    'Mullaitivu': 320,
    'Nuwara Eliya': 250,
    'Polonnaruwa': 290,
    'Puttalam': 320,
    'Ratnapura': 180,
    'Trincomalee': 270,
    'Vavuniya': 380
  },
  'Jaffna': {
    'Ampara': 360,
    'Anuradhapura': 270,
    'Badulla': 250,
    'Batticaloa': 300,
    'Colombo': 400,
    'Galle': 440,
    'Gampaha': 410,
    'Hambantota': 380,
    'Kalutara': 370,
    'Kandy': 340,
    'Kegalle': 340,
    'Kilinochchi': 70,
    'Kurunegala': 420,
    'Mannar': 120,
    'Matale': 350,
    'Matara': 420,
    'Moneragala': 320,
    'Mullaitivu': 200,
    'Nuwara Eliya': 400,
    'Polonnaruwa': 320,
    'Puttalam': 460,
    'Ratnapura': 340,
    'Trincomalee': 360,
    'Vavuniya': 150
  },
  'Kalutara': {
    'Ampara': 370,
    'Anuradhapura': 250,
    'Badulla': 270,
    'Batticaloa': 340,
    'Colombo': 40,
    'Galle': 120,
    'Gampaha': 50,
    'Hambantota': 230,
    'Jaffna': 370,
    'Kandy': 130,
    'Kegalle': 70,
    'Kilinochchi': 340,
    'Kurunegala': 130,
    'Mannar': 420,
    'Matale': 230,
    'Matara': 150,
    'Moneragala': 260,
    'Mullaitivu': 330,
    'Nuwara Eliya': 210,
    'Polonnaruwa': 250,
    'Puttalam': 90,
    'Ratnapura': 180,
    'Trincomalee': 220,
    'Vavuniya': 340
  },
  'Kandy': {
    'Ampara': 225,
    'Anuradhapura': 180,
    'Badulla': 114,
    'Batticaloa': 260,
    'Colombo': 115,
    'Galle': 200,
    'Gampaha': 90,
    'Hambantota': 220,
    'Jaffna': 340,
    'Kalutara': 130,
    'Kegalle': 60,
    'Kilinochchi': 350,
    'Kurunegala': 70,
    'Mannar': 380,
    'Matale': 28,
    'Matara': 270,
    'Moneragala': 130,
    'Mullaitivu': 350,
    'Nuwara Eliya': 80,
    'Polonnaruwa': 200,
    'Puttalam': 190,
    'Ratnapura': 150,
    'Trincomalee': 270,
    'Vavuniya': 290
  },
  'Kegalle': {
    'Ampara': 280,
    'Anuradhapura': 150,
    'Badulla': 140,
    'Batticaloa': 270,
    'Colombo': 60,
    'Galle': 180,
    'Gampaha': 30,
    'Hambantota': 150,
    'Jaffna': 340,
    'Kalutara': 70,
    'Kandy': 60,
    'Kilinochchi': 330,
    'Kurunegala': 80,
    'Mannar': 380,
    'Matale': 30,
    'Matara': 200,
    'Moneragala': 160,
    'Mullaitivu': 350,
    'Nuwara Eliya': 160,
    'Polonnaruwa': 200,
    'Puttalam': 210,
    'Ratnapura': 120,
    'Trincomalee': 270,
    'Vavuniya': 300
  },
  'Kilinochchi': {
    'Ampara': 320,
    'Anuradhapura': 120,
    'Badulla': 260,
    'Batticaloa': 230,
    'Colombo': 340,
    'Galle': 400,
    'Gampaha': 340,
    'Hambantota': 320,
    'Jaffna': 70,
    'Kalutara': 340,
    'Kandy': 350,
    'Kegalle': 330,
    'Kurunegala': 310,
    'Mannar': 100,
    'Matale': 320,
    'Matara': 400,
    'Moneragala': 310,
    'Mullaitivu': 90,
    'Nuwara Eliya': 360,
    'Polonnaruwa': 290,
    'Puttalam': 420,
    'Ratnapura': 310,
    'Trincomalee': 280,
    'Vavuniya': 150
  },
  'Kurunegala': {
    'Ampara': 290,
    'Anuradhapura': 160,
    'Badulla': 190,
    'Batticaloa': 290,
    'Colombo': 80,
    'Galle': 210,
    'Gampaha': 70,
    'Hambantota': 200,
    'Jaffna': 420,
    'Kalutara': 130,
    'Kandy': 70,
    'Kegalle': 80,
    'Kilinochchi': 310,
    'Mannar': 350,
    'Matale': 70,
    'Matara': 200,
    'Moneragala': 170,
    'Mullaitivu': 350,
    'Nuwara Eliya': 200,
    'Polonnaruwa': 210,
    'Puttalam': 100,
    'Ratnapura': 150,
    'Trincomalee': 270,
    'Vavuniya': 300
  },
  'Mannar': {
    'Ampara': 390,
    'Anuradhapura': 230,
    'Badulla': 250,
    'Batticaloa': 320,
    'Colombo': 390,
    'Galle': 480,
    'Gampaha': 400,
    'Hambantota': 360,
    'Jaffna': 120,
    'Kalutara': 420,
    'Kandy': 380,
    'Kegalle': 380,
    'Kilinochchi': 100,
    'Kurunegala': 350,
    'Matale': 360,
    'Matara': 490,
    'Moneragala': 350,
    'Mullaitivu': 290,
    'Nuwara Eliya': 400,
    'Polonnaruwa': 320,
    'Puttalam': 480,
    'Ratnapura': 390,
    'Trincomalee': 380,
    'Vavuniya': 130
  },
  'Matale': {
    'Ampara': 260,
    'Anuradhapura': 130,
    'Badulla': 120,
    'Batticaloa': 250,
    'Colombo': 160,
    'Galle': 220,
    'Gampaha': 180,
    'Hambantota': 270,
    'Jaffna': 350,
    'Kalutara': 230,
    'Kandy': 28,
    'Kegalle': 30,
    'Kilinochchi': 320,
    'Kurunegala': 70,
    'Mannar': 360,
    'Matara': 230,
    'Moneragala': 90,
    'Mullaitivu': 350,
    'Nuwara Eliya': 60,
    'Polonnaruwa': 190,
    'Puttalam': 210,
    'Ratnapura': 200,
    'Trincomalee': 290,
    'Vavuniya': 280
  },
  'Matara': {
    'Ampara': 350,
    'Anuradhapura': 310,
    'Badulla': 240,
    'Batticaloa': 310,
    'Colombo': 160,
    'Galle': 40,
    'Gampaha': 290,
    'Hambantota': 60,
    'Jaffna': 420,
    'Kalutara': 150,
    'Kandy': 270,
    'Kegalle': 200,
    'Kilinochchi': 400,
    'Kurunegala': 200,
    'Mannar': 490,
    'Matale': 230,
    'Moneragala': 280,
    'Mullaitivu': 350,
    'Nuwara Eliya': 250,
    'Polonnaruwa': 290,
    'Puttalam': 320,
    'Ratnapura': 220,
    'Trincomalee': 320,
    'Vavuniya': 420
  },
  'Moneragala': {
    'Ampara': 100,
    'Anuradhapura': 160,
    'Badulla': 50,
    'Batticaloa': 110,
    'Colombo': 130,
    'Galle': 320,
    'Gampaha': 250,
    'Hambantota': 120,
    'Jaffna': 370,
    'Kalutara': 260,
    'Kandy': 130,
    'Kegalle': 160,
    'Kilinochchi': 310,
    'Kurunegala': 170,
    'Mannar': 350,
    'Matale': 90,
    'Matara': 280,
    'Mullaitivu': 380,
    'Nuwara Eliya': 260,
    'Polonnaruwa': 210,
    'Puttalam': 350,
    'Ratnapura': 180,
    'Trincomalee': 250,
    'Vavuniya': 290
  },
  'Mullaitivu': {
    'Ampara': 270,
    'Anuradhapura': 330,
    'Badulla': 350,
    'Batticaloa': 260,
    'Colombo': 340,
    'Galle': 480,
    'Gampaha': 400,
    'Hambantota': 320,
    'Jaffna': 200,
    'Kalutara': 330,
    'Kandy': 350,
    'Kegalle': 350,
    'Kilinochchi': 90,
    'Kurunegala': 350,
    'Mannar': 290,
    'Matale': 350,
    'Matara': 350,
    'Moneragala': 380,
    'Nuwara Eliya': 380,
    'Polonnaruwa': 340,
    'Puttalam': 490,
    'Ratnapura': 380,
    'Trincomalee': 420,
    'Vavuniya': 150
  },
  'Nuwara Eliya': {
    'Ampara': 220,
    'Anuradhapura': 250,
    'Badulla': 100,
    'Batticaloa': 260,
    'Colombo': 300,
    'Galle': 370,
    'Gampaha': 320,
    'Hambantota': 380,
    'Jaffna': 390,
    'Kalutara': 210,
    'Kandy': 80,
    'Kegalle': 160,
    'Kilinochchi': 360,
    'Kurunegala': 200,
    'Mannar': 400,
    'Matale': 60,
    'Matara': 250,
    'Moneragala': 260,
    'Mullaitivu': 380,
    'Polonnaruwa': 350,
    'Puttalam': 400,
    'Ratnapura': 340,
    'Trincomalee': 350,
    'Vavuniya': 400
  },
  'Polonnaruwa': {
    'Ampara': 250,
    'Anuradhapura': 90,
    'Badulla': 220,
    'Batticaloa': 250,
    'Colombo': 220,
    'Galle': 290,
    'Gampaha': 290,
    'Hambantota': 270,
    'Jaffna': 350,
    'Kalutara': 250,
    'Kandy': 200,
    'Kegalle': 200,
    'Kilinochchi': 290,
    'Kurunegala': 210,
    'Mannar': 320,
    'Matale': 190,
    'Matara': 290,
    'Moneragala': 210,
    'Mullaitivu': 340,
    'Nuwara Eliya': 350,
    'Puttalam': 320,
    'Ratnapura': 250,
    'Trincomalee': 270,
    'Vavuniya': 380
  },
  'Puttalam': {
    'Ampara': 310,
    'Anuradhapura': 140,
    'Badulla': 240,
    'Batticaloa': 290,
    'Colombo': 140,
    'Galle': 260,
    'Gampaha': 220,
    'Hambantota': 310,
    'Jaffna': 420,
    'Kalutara': 90,
    'Kandy': 190,
    'Kegalle': 210,
    'Kilinochchi': 420,
    'Kurunegala': 100,
    'Mannar': 480,
    'Matale': 210,
    'Matara': 320,
    'Moneragala': 350,
    'Mullaitivu': 490,
    'Nuwara Eliya': 400,
    'Polonnaruwa': 320,
    'Ratnapura': 300,
    'Trincomalee': 330,
    'Vavuniya': 400
  },
  'Ratnapura': {
    'Ampara': 180,
    'Anuradhapura': 270,
    'Badulla': 140,
    'Batticaloa': 300,
    'Colombo': 140,
    'Galle': 260,
    'Gampaha': 180,
    'Hambantota': 170,
    'Jaffna': 360,
    'Kalutara': 180,
    'Kandy': 150,
    'Kegalle': 120,
    'Kilinochchi': 320,
    'Kurunegala': 140,
    'Mannar': 390,
    'Matale': 200,
    'Matara': 220,
    'Moneragala': 180,
    'Mullaitivu': 380,
    'Nuwara Eliya': 340,
    'Polonnaruwa': 250,
    'Puttalam': 300,
    'Trincomalee': 210,
    'Vavuniya': 380
  },
  'Trincomalee': {
    'Ampara': 300,
    'Anuradhapura': 190,
    'Badulla': 310,
    'Batticaloa': 280,
    'Colombo': 260,
    'Galle': 320,
    'Gampaha': 290,
    'Hambantota': 290,
    'Jaffna': 350,
    'Kalutara': 220,
    'Kandy': 270,
    'Kegalle': 270,
    'Kilinochchi': 280,
    'Kurunegala': 270,
    'Mannar': 380,
    'Matale': 290,
    'Matara': 320,
    'Moneragala': 250,
    'Mullaitivu': 420,
    'Nuwara Eliya': 350,
    'Polonnaruwa': 270,
    'Puttalam': 330,
    'Ratnapura': 210,
    'Vavuniya': 400
  },
  'Vavuniya': {
    'Ampara': 400,
    'Anuradhapura': 170,
    'Badulla': 330,
    'Batticaloa': 390,
    'Colombo': 380,
    'Galle': 480,
    'Gampaha': 420,
    'Hambantota': 390,
    'Jaffna': 130,
    'Kalutara': 340,
    'Kandy': 290,
    'Kegalle': 300,
    'Kilinochchi': 150,
    'Kurunegala': 300,
    'Mannar': 130,
    'Matale': 280,
    'Matara': 420,
    'Moneragala': 290,
    'Mullaitivu': 400,
    'Nuwara Eliya': 400,
    'Polonnaruwa': 380,
    'Puttalam': 400,
    'Ratnapura': 280,
    'Trincomalee': 400
  }
    };

  final DatabaseReference dbRef = FirebaseDatabase.instance
      .ref('carbonResults'); // Reference to Firebase Realtime Database

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Carbon Footprint Calculator',
            style: TextStyle(color: Colors.white)),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Calculate Your Carbon Footprint',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal.shade700,
                  ),
                ),
                const SizedBox(height: 20),

                // Pickup Location Dropdown
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Pickup Location',
                    labelStyle: TextStyle(color: Colors.teal.shade800),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  items: locations.map((location) {
                    return DropdownMenuItem(
                      value: location,
                      child: Text(location),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      pickupLocation = value;
                      _updateDistance(); // Update distance when pickup changes
                    });
                  },
                ),
                const SizedBox(height: 16),

                // Drop-off Location Dropdown
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Drop-off Location',
                    labelStyle: TextStyle(color: Colors.teal.shade800),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  items: locations.map((location) {
                    return DropdownMenuItem(
                      value: location,
                      child: Text(location),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      dropOffLocation = value;
                      _updateDistance(); // Update distance when drop-off changes
                    });
                  },
                ),
                const SizedBox(height: 16),

                // Distance Input - read-only
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Distance (km)',
                    labelStyle: TextStyle(color: Colors.teal.shade800),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  readOnly: true, // Make the distance field read-only
                  controller:
                      TextEditingController(text: distance.toStringAsFixed(2)),
                ),
                const SizedBox(height: 16),

                // Travel Mode Selection with Icons
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildModeButton(Icons.directions_car, 'Car'),
                      _buildModeButton(Icons.directions_bus, 'Bus'),
                      _buildModeButton(Icons.directions_bike, 'Bicycle'),
                      _buildModeButton(Icons.train, 'Train'),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Centered Calculate Button
                Center(
                  child: ElevatedButton(
onPressed: () async {
  if (_formKey.currentState!.validate()) {
    _formKey.currentState!.save();

    // Calculate emissions for all travel modes
    Map<String, double> emissionsMap = _calculateCarbonEmissions();

    // Navigate to results page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CarbonResults(
          emissions: emissionsMap[travelMode]!, // Emission for selected mode
          pickupLocation: pickupLocation!,
          dropOffLocation: dropOffLocation!,
          travelMode: travelMode!,
          allEmissions: emissionsMap, // Pass all emissions
        ),
      ),
    );

    // Save data to Firebase
    await _saveDataToFirebase(emissionsMap[travelMode]!);
  }
},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      padding:
                          const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      'Calculate',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget to build travel mode buttons
  Widget _buildModeButton(IconData icon, String mode) {
    return InkWell(
      onTap: () {
        setState(() {
          travelMode = mode;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color:
              travelMode == mode ? Colors.teal.shade200 : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(icon,
                color: travelMode == mode ? Colors.teal : Colors.grey,
                size: 30),
            const SizedBox(height: 8),
            Text(
              mode,
              style: TextStyle(
                  color: travelMode == mode
                      ? Colors.teal.shade700
                      : Colors.grey.shade700),
            ),
          ],
        ),
      ),
    );
  }

  // Update distance based on selected locations
  void _updateDistance() {
    if (pickupLocation != null && dropOffLocation != null) {
      // Fetch the distance from the locationDistances map
      distance = locationDistances[pickupLocation]?[dropOffLocation] ??
          0.0; // Get distance based on selected locations
      print(
          'Distance from $pickupLocation to $dropOffLocation: $distance km'); // Debugging print statement
      setState(() {}); // Refresh the UI
    } else {
      distance = 0.0; // Reset distance if either location is null
      setState(() {});
    }
  }

  // Calculate carbon emissions based on distance and travel mode
  // double _calculateCarbonEmissions() {
  //   double emissionFactor;

  //   // Set emission factors in kg CO2/km based on travel mode
  //   switch (travelMode) {
  //     case 'Car':
  //       emissionFactor = 0.2; // Example: 0.2 kg CO2/km for cars
  //       break;
  //     case 'Bus':
  //       emissionFactor = 0.05; // Example: 0.05 kg CO2/km for buses
  //       break;
  //     case 'Bicycle':
  //       emissionFactor = 0.01; // Example: 0.01 kg CO2/km for bicycles
  //       break;
  //     case 'Train':
  //       emissionFactor = 0.03; // Example: 0.03 kg CO2/km for trains
  //       break;
  //     default:
  //       emissionFactor = 0.0; // Default value
  //       break;
  //   }

  //   return distance * emissionFactor; // Calculate total emissions
  // }

  // Calculate carbon emissions based on distance and travel mode
Map<String, double> _calculateCarbonEmissions() {
  double carEmissions = distance * 0.2;    // Example: 0.2 kg CO2/km for cars
  double busEmissions = distance * 0.05;   // Example: 0.05 kg CO2/km for buses
  double bicycleEmissions = distance * 0.01; // Example: 0.01 kg CO2/km for bicycles
  double trainEmissions = distance * 0.03; // Example: 0.03 kg CO2/km for trains

  return {
    'Car': carEmissions,
    'Bus': busEmissions,
    'Bicycle': bicycleEmissions,
    'Train': trainEmissions,
  };
}


  // Save data to Firebase Realtime Database
  Future<void> _saveDataToFirebase(double emissions) async {
    String key = dbRef.push().key!; // Generate a unique key for the new entry
    await dbRef.child(key).set({
      'pickupLocation': pickupLocation,
      'dropOffLocation': dropOffLocation,
      'travelMode': travelMode,
      'emissions': emissions,
      'timestamp': DateTime.now().millisecondsSinceEpoch, // Store timestamp
    });
    print(
        'Data saved to Firebase: $pickupLocation, $dropOffLocation, $travelMode, $emissions');
  }
}