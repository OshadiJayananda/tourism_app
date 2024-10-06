import 'package:flutter/material.dart';
import './EcoFriendlyTours.dart';

class EcofriendlyOptionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Greeny Way - Eco-friendly Options'),
        backgroundColor: Color(0xFF009688),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Your Eco-friendly Journey Title and Subtitle
            Text(
              "Your Eco-friendly Journey",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Reduce your carbon footprint with sustainable travel options.",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 16),

            // Best Travel Modes Section
            Text(
              "Best Travel Modes",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Public Transport Option
                _buildTravelModeOption(
                  title: "Eco-friendly Travel",
                  subtitle: "Public Transport\nLow carbon emissions",
                  isRecommended: true,
                ),
                // Cycling Option
                _buildTravelModeOption(
                  title: "Eco-friendly Travel",
                  subtitle: "Cycling\nZero emissions",
                ),
              ],
            ),
            SizedBox(height: 16),

            // Alternative Suggestions Section
            Text(
              "Alternative Suggestions",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 8),

            // Suggestions List
            ListTile(
              leading: Icon(Icons.directions_walk, color: Colors.green),
              title: Text("Walking"),
              subtitle: Text("Reduce emissions and stay active"),
            ),
            ListTile(
              leading: Icon(Icons.nature, color: Colors.green),
              title: Text("Plant Trees"),
              subtitle: Text("Offset your carbon footprint"),
            ),
            SizedBox(height: 16),

            // Discover Button
ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EcoFriendlyTours()),
    );
  },
  child: Text('Discover Eco-friendly Tours'),
  style: ElevatedButton.styleFrom(
    backgroundColor: Color(0xFF009688),
    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
  ),
)
          ],
        ),
      ),
    );
  }

  // Helper method to create travel mode options
  Widget _buildTravelModeOption({required title, required String subtitle, bool isRecommended = false}) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isRecommended)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                color: Colors.green[700],
                child: Text(
                  "Recommended",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
