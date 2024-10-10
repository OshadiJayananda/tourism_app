import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'searched_page.dart'; // Import the SearchedPage
import 'weather_page.dart'; // Import the WeatherPage
import 'photo_page.dart'; // Import the PhotoPage

class DestinationPage extends StatefulWidget {
  const DestinationPage({super.key});

  @override
  State<DestinationPage> createState() => _DestinationPageState();
}

class _DestinationPageState extends State<DestinationPage> {
  final TextEditingController _searchController = TextEditingController();
  final DatabaseReference _database = FirebaseDatabase.instance.ref('destinations');

  void _searchPlaces(String query) async {
    // Ensure the query is not empty
    if (query.isEmpty) {
      print("Search query is empty.");
      return;
    }

    // Fetch the data from Firebase
    DatabaseEvent event = await _database.once();
    DataSnapshot snapshot = event.snapshot;

    final List<Map<String, String>> filteredDestinations = [];
    if (snapshot.value != null) {
      // Safely check and iterate over the Firebase data
      final data = snapshot.value as Map<dynamic, dynamic>?;

      if (data != null) {
        print("Destinations: ${data.length} found"); // Debug print

        data.forEach((key, value) {
          if (value is Map<dynamic, dynamic>) {
            // Try to cast each entry safely
            final destination = Map<String, dynamic>.from(value);

            print("Destination: ${destination['name']}, Province: ${destination['province']}");

            if (destination['province'] != null &&
                destination['province'].toString().toLowerCase().contains(query.toLowerCase())) {
              filteredDestinations.add({
                'name': destination['name'] ?? '',
                'province': destination['province'] ?? '',
                'image': destination['image'] ?? '',
              });
            }
          }
        });

        // Debug print for filtered results
        print("Filtered Destinations: ${filteredDestinations.length} found");

        // Navigate to SearchedPage and pass filtered destinations
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SearchedPage(destinations: filteredDestinations),
          ),
        );
      } else {
        print("No data found in Firebase.");
      }
    } else {
      print("No data found in Firebase.");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
        title: const Text('Explore'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Navigation bar with three main categories
            Container(
              height: 100, // Adjusted height
              decoration: const BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(40)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: CategoryWidget(
                        icon: Icons.place,
                        label: "Destinations",
                        onTap: () {},
                      ),
                    ),
                    Expanded(
                      child: CategoryWidget(
                        icon: Icons.wb_sunny,
                        label: "Weather",
                        onTap: () {
                          // Navigate to the WeatherPage
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const WeatherPage()),
                          );
                        },
                      ),
                    ),
                    Expanded(
                      child: CategoryWidget(
                        icon: Icons.photo_library,
                        label: "Photos",
                        onTap: () {
                          // Navigate to the PhotoPage
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const PhotoPage()),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Search bar after the navigation bar
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search by province',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: Colors.grey[200],
                  filled: true,
                  contentPadding: const EdgeInsets.all(12.0),
                ),
                onSubmitted: _searchPlaces, // Trigger search on submission
              ),
            ),

            // Suggested Places section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Suggested Places',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  _buildSuggestedPlace('assets/images/galle-fort.jpg', 'Galle Fort'),
                  const SizedBox(height: 16),
                  _buildSuggestedPlace('assets/images/namunukula.webp', 'Namunukula'),
                  const SizedBox(height: 16),
                  _buildSuggestedPlace('assets/images/nine-arch.jpg', 'Nine-Arch'),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Align(
              alignment: Alignment.bottomCenter,
              child: TextButton(
                onPressed: () {
                  // Add functionality for 'See More' button
                },
                child: const Text(
                  'See More...',
                  style: TextStyle(fontSize: 16, color: Colors.teal),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSuggestedPlace(String imagePath, String title) {
    return Stack(
      children: [
        Container(
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 10,
          left: 10,
          child: Container(
            color: Colors.black54,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CategoryWidget extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const CategoryWidget({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon, size: 40, color: Colors.white),
          const SizedBox(height: 10),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
