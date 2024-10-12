import 'package:flutter/material.dart';
import 'package:tourism_app/Pages/locationweather_page.dart';

class SearchedPage extends StatelessWidget {
  final List<Map<String, String>> destinations;

  const SearchedPage({super.key, required this.destinations});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Results'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: destinations.length,
          itemBuilder: (context, index) {
            final destination = destinations[index];

            return Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Stack(
                children: [
                  // Image with rounded corners
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage(destination['image'] ?? 'assets/images/placeholder.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  // Overlay with destination name and province
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Container(
                      color: Colors.black54,
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            destination['name'] ?? 'Unknown Destination',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            destination['province'] ?? 'Unknown Province',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Weather icon at the bottom right corner
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: IconButton(
                      icon: const Icon(
                        Icons.wb_sunny, // Weather icon
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: () {
                        // Navigate to the location weather page, passing the destination name
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LocationWeatherPage(locationName: destination['name'] ?? 'Unknown'),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
