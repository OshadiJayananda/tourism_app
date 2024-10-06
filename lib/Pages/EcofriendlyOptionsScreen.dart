import 'package:flutter/material.dart';
import './EcoFriendlyTours.dart';

class EcofriendlyOptionsScreen extends StatelessWidget {
  const EcofriendlyOptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Greeny Way - Eco-friendly Options'),
        backgroundColor: const Color(0xFF009688),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Your Eco-friendly Journey Title and Subtitle
            const Text(
              "Your Eco-friendly Journey",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Reduce your carbon footprint with sustainable travel options.",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 16),

            // Best Travel Modes Section
            const Text(
              "Best Travel Modes",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
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
            const SizedBox(height: 16),

            // Alternative Suggestions Section
            const Text(
              "Alternative Suggestions",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),

            // Suggestions List
            const ListTile(
              leading: Icon(Icons.directions_walk, color: Colors.green),
              title: Text("Walking"),
              subtitle: Text("Reduce emissions and stay active"),
            ),
            const ListTile(
              leading: Icon(Icons.nature, color: Colors.green),
              title: Text("Plant Trees"),
              subtitle: Text("Offset your carbon footprint"),
            ),
            const SizedBox(height: 16),

            // Discover Button
ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EcoFriendlyTours()),
    );
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: const Color(0xFF009688),
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
  ),
  child: Text('Discover Eco-friendly Tours'),
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
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isRecommended)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                color: Colors.green[700],
                child: const Text(
                  "Recommended",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              style: const TextStyle(
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
