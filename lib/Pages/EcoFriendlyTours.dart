import 'package:flutter/material.dart';

class EcoFriendlyTours extends StatelessWidget {
  const EcoFriendlyTours({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Eco-Friendly Tours'),
        backgroundColor: const Color(0xFF004D40), // Dark green
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Recommended Eco-Friendly Tours Title
            const Text(
              "Recommended Eco-Friendly Tours",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),

            // Recommended Tours Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildTourOption(
                  context: context,
                  title: "Tour 1",
                  description: "Details for Tour 1",
                  imageDescription: "Image Description 1",
                ),
                _buildTourOption(
                  context: context,
                  title: "Tour 2",
                  description: "Details for Tour 2",
                  imageDescription: "Image Description 2",
                ),
              ],
            ),
            const SizedBox(height: 32),

            // Eco-Friendly Travel Tips Title
            const Text(
              "Eco-Friendly Travel Tips",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),

            // Travel Tips List
            _buildTravelTip(
              title: "Tip 1",
              description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
              tags: ["Eco-friendly", "Travel"],
            ),
            const SizedBox(height: 16),
            _buildTravelTip(
              title: "Tip 2",
              description: "Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
              tags: ["Sustainability"],
            ),
          ],
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Tours',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb_outline),
            label: 'Tips',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
        selectedItemColor: const Color(0xFF004D40), // Active color for bottom navigation
        unselectedItemColor: Colors.grey,
        onTap: (int index) {
          // Handle bottom navigation actions here
        },
      ),
    );
  }

  // Helper method to build tour options
  Widget _buildTourOption({
    required BuildContext context,
    required String title,
    required String description,
    required String imageDescription,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          // Handle tap for navigating to details of the tour
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Clicked on $title')),
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
              Text(
                "Eco-friendly",
                style: TextStyle(
                  color: Colors.green[800],
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                height: 80,
                width: double.infinity,
                color: Colors.grey[300],
                child: Center(child: Text(imageDescription)),
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
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
    required String title,
    required String description,
    required List<String> tags,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: tags.map((tag) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
              fontSize: 18,
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
    );
  }
}
