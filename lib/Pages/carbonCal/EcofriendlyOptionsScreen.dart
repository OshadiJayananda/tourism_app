import 'package:flutter/material.dart';
import 'EcoFriendlyTours.dart';
import 'WalkingArticle.dart';
import 'PlantingTreesArticle.dart';
import 'PublicTransportArticle.dart';
import 'CyclingArticle.dart';

class EcofriendlyOptionsScreen extends StatelessWidget {
  const EcofriendlyOptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Greeny Way - Eco-friendly Options'),
        backgroundColor: const Color(0xFF009688),
        elevation: 0,
        centerTitle: true,
        // Adding some shadow for a more modern look
        shadowColor: Colors.black54,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title with better alignment
            const Text(
              "Your Eco-friendly Journey",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
                letterSpacing: 1.2, // Improves readability
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Reduce your carbon footprint with sustainable travel options.",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
                height: 1.5, // Line height for better spacing
              ),
            ),
            const SizedBox(height: 24), // Extra space for visual separation

            // Best Travel Modes Section
            const Text(
              "Best Travel Modes",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 16),

            // Travel Mode options in a card format
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildTravelModeOption(
                  context,
                  "Eco-friendly Travel",
                  "Public Transport\nLow carbon emissions",
                  "This article discusses the benefits of public transport as an eco-friendly travel option.",
                  isRecommended: true,
                  articleScreen: const PublicTransportArticle(),
                ),
                const SizedBox(width: 16),
                _buildTravelModeOption(
                  context,
                  "Eco-friendly Travel",
                  "Cycling\nZero emissions",
                  "Cycling is one of the best ways to travel sustainably. This article elaborates on its advantages.",
                  articleScreen: const CyclingArticle(),
                ),
              ],
            ),
            const SizedBox(height: 24), // Extra space after row

            // Alternative Suggestions Section
            const Text(
              "Alternative Suggestions",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 16),

            // Suggestions List
            Column(
              children: [
                _buildSuggestionListTile(
                  context,
                  "Walking",
                  "Reduce emissions and stay active",
                  "Walking is not only good for the environment but also for your health. This article discusses how walking contributes to sustainability.",
                  articleScreen: const WalkingArticle(),
                ),
                const Divider(), // Divider for better visual separation
                _buildSuggestionListTile(
                  context,
                  "Plant Trees",
                  "Offset your carbon footprint",
                  "Planting trees plays a crucial role in offsetting your carbon footprint. This article highlights its significance.",
                  articleScreen: const PlantingTreesArticle(),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Discover Button with rounded corners
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EcoFriendlyTours()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF009688),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 5,
                ),
                child: const Text(
                  'Discover Eco-friendly Tours',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to create travel mode options
  Widget _buildTravelModeOption(
    BuildContext context,
    String title,
    String subtitle,
    String article, {
    bool isRecommended = false,
    required Widget articleScreen,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          // Navigate to article screen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => articleScreen),
          );
        },
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (isRecommended)
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.green[700],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    "Recommended",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              const SizedBox(height: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                  height: 1.4, // Increase line height for better readability
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to create suggestion list tiles
  Widget _buildSuggestionListTile(
      BuildContext context, String title, String subtitle, String article,
      {required Widget articleScreen}) {
    return ListTile(
      contentPadding: const EdgeInsets.all(8.0),
      leading: const Icon(
        Icons.eco,
        color: Colors.teal,
        size: 30,
      ),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(color: Colors.black54),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => articleScreen),
        );
      },
    );
  }
}
