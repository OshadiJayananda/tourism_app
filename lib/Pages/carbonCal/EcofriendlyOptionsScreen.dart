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
                   context,
                  "Eco-friendly Travel",
                  "Public Transport\nLow carbon emissions",
                  "This article discusses the benefits of public transport as an eco-friendly travel option.",
                  isRecommended: true,
                  articleScreen: const PublicTransportArticle(),
                ),
                // Cycling Option
                _buildTravelModeOption(
                  context,
                 "Eco-friendly Travel",
                  "Cycling\nZero emissions",
                 "Cycling is one of the best ways to travel sustainably. This article elaborates on its advantages.",
                  articleScreen: const CyclingArticle(),
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
            Column(
              children: [
                _buildSuggestionListTile(
                  context,
                  "Walking",
                  "Reduce emissions and stay active",
                  "Walking is not only good for the environment but also for your health. This article discusses how walking contributes to sustainability.",
                  articleScreen: const WalkingArticle(),
                ),
                _buildSuggestionListTile(
                  context,
                  "Plant Trees",
                  "Offset your carbon footprint",
                  "Planting trees plays a crucial role in offsetting your carbon footprint. This article highlights its significance.",
                  articleScreen: const PlantingTreesArticle(),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Discover Button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const EcoFriendlyTours()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF009688),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: const Text('Discover Eco-friendly Tours'),
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
        // Use the articleScreen parameter to navigate
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => articleScreen),
        );
      },
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
    ),
  );
}
  // Helper method to create suggestion list tiles
  Widget _buildSuggestionListTile(
      BuildContext context, 
      String title, 
      String subtitle, 
      String article,
      {required Widget articleScreen}) {
    return ListTile(
      leading: const Icon(Icons.nature, color: Colors.green),
      title: Text(title),
      subtitle: Text(subtitle),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => articleScreen),
        );
      },
    );
  }
}

// Article screen to display detailed content
class ArticleScreen extends StatelessWidget {
  final String title;
  final String content;

  const ArticleScreen({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: const Color(0xFF009688),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              content,
              style: const TextStyle(fontSize: 16, color: Colors.black54),
            ),
            // Add an image if needed
            const SizedBox(height: 16),
            Center(
              child: Image.network(
                'https://example.com/image.jpg', // Replace with a valid image URL
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
