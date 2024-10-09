import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Tip2Page extends StatelessWidget {
  const Tip2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tip 2 Details'),
        backgroundColor: const Color(0xFF004D40),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title of the tip
              Text(
                'Eco-Friendly Travel Tip 2',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal.shade700,
                ),
              ),
              const SizedBox(height: 16),

              // Main tip description
              Text(
                'Options for Greener Transportation Choices!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.teal.shade600,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Choosing eco-friendly transportation options, such as trains, bicycles, or electric vehicles, reduces your carbon footprint and helps protect the environment. These alternatives are more energy-efficient and emit far fewer greenhouse gases than conventional methods like cars and airplanes.',
                style: const TextStyle(fontSize: 16, height: 1.5),
              ),
              const SizedBox(height: 16),

              // Section for tips and icons
              Text(
                'Sustainable Travel Options',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal.shade700,
                ),
              ),
              const SizedBox(height: 16),

              // List of transportation tips
              Column(
                children: [
                  Row(
                    children: const [
                      Icon(
                        FontAwesomeIcons.train, // Train icon
                        color: Colors.green,
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Take trains for long-distance travel to reduce emissions.',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: const [
                      Icon(
                        FontAwesomeIcons.bicycle, // Bicycle icon
                        color: Colors.orange,
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Explore cities by bicycle – a healthy and eco-friendly option.',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: const [
                      Icon(
                        FontAwesomeIcons.car, // Electric vehicle icon
                        color: Colors.blueAccent,
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Rent electric or hybrid vehicles for eco-conscious road trips.',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Section with a visual message
              Container(
                decoration: BoxDecoration(
                  color: Colors.teal.shade50,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    const Icon(
                      FontAwesomeIcons.globeAmericas, // Earth icon
                      color: Colors.teal,
                      size: 40,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        'By choosing greener transportation, you are not only reducing your carbon footprint but also contributing to the preservation of our beautiful planet.',
                        style: TextStyle(
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                          color: Colors.teal.shade900,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Call to action
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Add your desired action here
                  },
                  icon: const Icon(Icons.directions_bike), // Bicycle icon
                  label: const Text('Start your eco-friendly journey'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal, // Background color
                    foregroundColor: Colors.white, // Text color
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
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
