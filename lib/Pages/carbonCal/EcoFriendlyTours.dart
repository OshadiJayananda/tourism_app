import 'package:flutter/material.dart';
import 'Tip1.dart';
import 'Tip2.dart';
import 'Tour1.dart';
import 'Tour2.dart';

class EcoFriendlyTours extends StatelessWidget {
  const EcoFriendlyTours({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Eco-Friendly Tours'),
        backgroundColor: const Color(0xFF009688), // Dark green
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Recommended Eco-Friendly Tours Title
            const Text(
              "Recommended Eco-Friendly Tours",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 30),

            // Recommended Tours Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildTourOption(
                  context: context,
                  title: "Tour 1",
                  description: "Journey with cycling",
                  image: 'assets/images/tour1.jpg', // Add your image asset path here
                  articlePage: const Tour1Page(),
                ),
                _buildTourOption(
                  context: context,
                  title: "Tour 2",
                  description: "Drive through the nature",
                  image: 'assets/images/tour2.jpg', // Add your image asset path here
                  articlePage: const Tour2Page(),
                ),
              ],
            ),
            const SizedBox(height: 40),

            // Eco-Friendly Travel Tips Title
            const Text(
              "Eco-Friendly Travel Tips",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),

            // Travel Tips List
            _buildTravelTip(
              context: context,
              title: "Tip 1",
              description: "Options for Reusable Items",
              tags: ["Eco-friendly", "Travel"],
              articlePage: const Tip1Page(),
            ),
            const SizedBox(height: 20),
            _buildTravelTip(
              context: context,
              title: "Tip 2",
              description: "Greener Transportation Choices!",
              tags: ["Sustainability"],
              articlePage: const Tip2Page(),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build tour options
  Widget _buildTourOption({
    required BuildContext context,
    required String title,
    required String description,
    required String image,
    required Widget articlePage,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => articlePage), // Navigate to the relevant article page
          );
        },
        child: Container(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6,
                offset: Offset(2, 2), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Eco-friendly",
                style: TextStyle(
                  color: Colors.green[800],
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: AssetImage(image), // Add image here
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                description,
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

  // Helper method to build travel tips
  Widget _buildTravelTip({
    required BuildContext context,
    required String title,
    required String description,
    required List<String> tags,
    required Widget articlePage, // Added parameter for the article page
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => articlePage), // Navigate to the relevant article page
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey[300]!),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(1, 1),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: tags.map((tag) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  margin: const EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    color: Colors.green[100],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    tag,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.green[800],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
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

