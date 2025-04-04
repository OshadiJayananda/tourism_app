import 'package:flutter/material.dart';

// Article for Planting Trees
class PlantingTreesArticle extends StatelessWidget {
  const PlantingTreesArticle({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Planting Trees - Nature's Air Filters"),
        backgroundColor: const Color(0xFF009688),
        centerTitle: true, // Centering the title for balance
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Planting Trees: A Gift to the Planet",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF00695C), // Darker shade of teal for main title
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Planting trees is one of the most effective ways to combat climate change. Trees absorb carbon dioxide and release oxygen, making our air cleaner and healthier. Moreover, they provide shelter to countless species and enhance biodiversity.",
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 16),
              Center(
                child: Image.asset(
                  'assets/images/planting.jpg', // Path to your illustration
                  height: 200, // Adjust height as needed
                  width: 300, // Adjust width as needed
                  fit: BoxFit.cover, // Cover to maintain aspect ratio
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Why Plant Trees?",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF00796B), // Lighter shade of teal for section titles
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "1. Air Quality Improvement: Trees filter pollutants and dust from the air, making it cleaner.\n"
                "2. Wildlife Habitat: Trees provide a home for numerous species of birds, insects, and mammals.\n"
                "3. Climate Regulation: Trees play a critical role in moderating the Earth's climate by reducing heat and conserving water.",
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 16),
              const Text(
                "How to Get Involved",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF00796B), // Lighter shade of teal for section titles
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Join local initiatives or start your own tree-planting project. Here are a few tips to make an impact:\n"
                "- Organize community planting events.\n"
                "- Educate others about the importance of trees.\n"
                "- Share your experiences on social media to inspire more people.",
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF009688),
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // Rounded button
                    ),
                  ),
                  child: const Text(
                    "Back to Eco-friendly Options",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // White text for better contrast
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
