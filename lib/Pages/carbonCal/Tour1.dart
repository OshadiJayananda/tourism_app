import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Add icons for more visuals

class Tour1Page extends StatelessWidget {
  const Tour1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Eco-Friendly Tour 1'),
        backgroundColor: const Color(0xFF004D40),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Go Green by Cycling: The Ultimate Eco-Friendly Tour',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal.shade900,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Cycling is one of the best ways to explore the beauty of nature while minimizing your environmental impact. Not only does it produce zero emissions, but it also offers a healthier and more immersive travel experience.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade800,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: const [
                  Icon(
                    FontAwesomeIcons.bicycle, // Bicycle icon
                    color: Colors.green,
                    size: 24,
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Cycling produces no carbon emissions, making it one of the greenest ways to travel.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                'Why Choose a Cycling Tour?',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal.shade800,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                '- Zero emissions and eco-friendly.\n'
                '- A closer connection with nature.\n'
                '- Flexible, customizable routes for a personalized adventure.\n'
                '- Accessible and affordable for all.\n',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              Row(
                children: const [
                  Icon(
                    FontAwesomeIcons.recycle, // Recycle icon
                    color: Colors.green,
                    size: 24,
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Bring reusable items like a water bottle and utensils to reduce waste during your journey.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                'Tour Highlights',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal.shade800,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                '- Explore stunning natural landscapes at a leisurely pace.\n'
                '- Stop at eco-friendly accommodations and restaurants.\n'
                '- Participate in local conservation efforts.\n'
                '- Enjoy the flexibility to follow your own adventure.\n',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Action when button is pressed (e.g., navigate to booking or details)
                  },
                  icon: const Icon(Icons.directions_bike), // Bike icon for button
                  label: const Text('Start Your Eco-Friendly Cycling Tour'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal.shade700, // Button background color
                    foregroundColor: Colors.white, // Text color
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
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
