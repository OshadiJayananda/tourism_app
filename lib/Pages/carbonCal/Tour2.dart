import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Make sure to add font_awesome_flutter package for icons.

class Tour2Page extends StatelessWidget {
  const Tour2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Eco-Friendly Tour 2'),
        backgroundColor: const Color(0xFF004D40),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Go Eco-Friendly: Take a Tour by Train',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal.shade900,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Train travel is one of the most eco-friendly ways to explore the world. With lower carbon emissions per passenger compared to air or car travel, trains offer a greener alternative for environmentally conscious travelers.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade800,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: const [
                  Icon(
                    FontAwesomeIcons.train, // Train icon
                    color: Colors.green,
                    size: 24,
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Trains emit up to 90% less CO2 than planes per journey. Opting for train travel is a great way to minimize your carbon footprint.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                'Why Choose Train Travel?',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal.shade800,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                '- Energy Efficiency: Trains are designed to carry large numbers of passengers, reducing the per-person fuel consumption.\n'
                '- Scenic Routes: Enjoy breathtaking landscapes, beautiful mountains, forests, and rivers while traveling.\n'
                '- Comfort: Stretch out, move freely, and even sleep overnight in cozy sleeper cabins on long journeys.\n'
                '- Convenience: Trains take you straight into city centers, reducing the need for additional transport.\n',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              Text(
                'Top Tips for Eco-Friendly Train Travel',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal.shade800,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: const [
                  Icon(
                    FontAwesomeIcons.solidLightbulb, // Eco tip icon
                    color: Colors.orange,
                    size: 24,
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Pack reusable essentials like a water bottle, coffee cup, and utensils to avoid single-use plastics during your journey.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
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
                      'Choose sustainable tour operators who prioritize eco-friendly accommodations and minimize environmental impact.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                'Highlights of Your Eco-Friendly Tour:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal.shade800,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                '- Explore green cities and sustainable tourist destinations.\n'
                '- Participate in local eco-friendly activities like hiking, biking, and community clean-up efforts.\n'
                '- Stay at eco-certified accommodations that utilize renewable energy and minimize water usage.\n'
                '- Savor organic, locally sourced food and support sustainable restaurants.\n',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Add your desired action here (e.g., navigate to booking or other tour details)
                  },
                  icon: const Icon(Icons.train), // Train icon
                  label: const Text('Book Your Eco-Friendly Train Tour'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal.shade700, // Button background color
                    foregroundColor: Colors.white, // Button text color
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
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
