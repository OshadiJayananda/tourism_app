import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'carbonresults.dart'; // Import your results page here

class CarbonFootprintCalculator extends StatefulWidget {
  @override
  _CarbonFootprintCalculatorState createState() => _CarbonFootprintCalculatorState();
}

class _CarbonFootprintCalculatorState extends State<CarbonFootprintCalculator> {
  final _formKey = GlobalKey<FormState>();
  String? pickupLocation;
  String? dropOffLocation;
  String? travelMode;
  double distance = 0.0; // Distance in kilometers
  final List<String> locations = [
    'Ampara', 'Anuradhapura', 'Badulla', 'Batticaloa', 'Colombo', 
    'Galle', 'Gampaha', 'Hambantota', 'Jaffna', 'Kalutara', 
    'Kandy', 'Kegalle', 'Kilinochchi', 'Kurunegala', 'Mannar', 
    'Matale', 'Matara', 'Moneragala', 'Mullaitivu', 'Nuwara Eliya', 
    'Polonnaruwa', 'Puttalam', 'Ratnapura', 'Trincomalee', 'Vavuniya'
  ];
  
  final Map<String, Map<String, double>> locationDistances = {
    'Ampara': {'Colombo': 330, 'Galle': 385, 'Kandy': 225},
    'Colombo': {'Galle': 116, 'Kandy': 115, 'Anuradhapura': 206},
    'Galle': {'Kandy': 200, 'Anuradhapura': 250},
    'Kandy': {'Anuradhapura': 180},
    // Add more distances between locations here
  };

  final DatabaseReference dbRef = FirebaseDatabase.instance.ref(); // Reference to Firebase Realtime Database

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Carbon Footprint Calculator', style: TextStyle(color: Colors.white)),
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
                SizedBox(height: 20),

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
                SizedBox(height: 16),

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
                SizedBox(height: 16),

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
                  controller: TextEditingController(text: distance.toStringAsFixed(2)),
                ),
                SizedBox(height: 16),

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
                SizedBox(height: 20),

                // Centered Calculate Button
                Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();

                        // Calculate emissions
                        double emissions = _calculateCarbonEmissions();

                        // Navigate to results page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CarbonResults(
                              emissions: emissions,
                              pickupLocation: pickupLocation!,
                              dropOffLocation: dropOffLocation!,
                              travelMode: travelMode!,
                            ),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 24),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      'Calculate',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                SizedBox(height: 20),
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
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: travelMode == mode ? Colors.teal.shade200 : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(icon, color: travelMode == mode ? Colors.teal : Colors.grey, size: 30),
            SizedBox(height: 8),
            Text(
              mode,
              style: TextStyle(color: travelMode == mode ? Colors.teal.shade700 : Colors.grey.shade700),
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
      distance = locationDistances[pickupLocation]?[dropOffLocation] ?? 0.0; // Get distance based on selected locations
      print('Distance from $pickupLocation to $dropOffLocation: $distance km'); // Debugging print statement
      setState(() {}); // Refresh the UI
    } else {
      distance = 0.0; // Reset distance if either location is null
      setState(() {});
    }
  }

  // Calculate carbon emissions based on distance and travel mode
  double _calculateCarbonEmissions() {
    double emissionFactor;

    // Set emission factors in kg CO2/km based on travel mode
    switch (travelMode) {
      case 'Car':
        emissionFactor = 0.2; // Example: 0.2 kg CO2/km for cars
        break;
      case 'Bus':
        emissionFactor = 0.05; // Example: 0.05 kg CO2/km for buses
        break;
      case 'Bicycle':
        emissionFactor = 0.01; // Example: 0.01 kg CO2/km for bicycles
        break;
      case 'Train':
        emissionFactor = 0.03; // Example: 0.03 kg CO2/km for trains
        break;
      default:
        emissionFactor = 0.0; // Default value
        break;
    }

    return distance * emissionFactor; // Calculate total emissions
  }
}
