import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // For icons

class Tip1Page extends StatelessWidget {
  const Tip1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Eco-Friendly Travel Tip 1'),
        backgroundColor: const Color(0xFF004D40),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              Row(
                children: const [
                  Icon(
                    FontAwesomeIcons.leaf, // Leaf icon for eco-friendly
                    color: Colors.green,
                    size: 28,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Eco-Friendly Travel Tip 1',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Section with highlighted tips
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: const [
                    Icon(
                      FontAwesomeIcons.suitcaseRolling, // Luggage icon
                      color: Colors.brown,
                      size: 28,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Pack light! The heavier your luggage, the more fuel your transportation will use.',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Expanded paragraph with tips
              const Text(
                'Why Packing Light Matters:',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Packing light doesn’t just make your trip more comfortable—it can have a significant environmental impact! '
                'When you carry less, planes, cars, buses, or trains consume less fuel, lowering carbon emissions. '
                'Aim to carry only the essentials and choose multipurpose items to reduce the overall weight of your luggage.',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 16),

              // Reusable items section
              const Text(
                'Options for Reusable Items:',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Consider swapping single-use plastics with eco-friendly alternatives. Here are some ideas:',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),

              // List of reusable item tips
              Row(
                children: const [
                  Icon(
                    FontAwesomeIcons.droplet,  // Water bottle icon
                    color: Colors.blue,
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Carry a refillable water bottle to reduce plastic waste.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: const [
                  Icon(
                    FontAwesomeIcons.shoppingBag, // Shopping bag icon
                    color: Colors.orange,
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Use a cloth bag instead of single-use plastic bags for shopping.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: const [
                  Icon(
                    FontAwesomeIcons.utensils, // Cutlery icon
                    color: Colors.green,
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Bring your own reusable utensils when eating out to minimize plastic waste.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Call to action
              const Text(
                'Remember:',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Small changes can make a big difference! By making these sustainable choices, '
                'you’re not only helping the environment but also inspiring others to do the same.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),

              // Bonus travel eco-tip section
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.teal.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: const [
                    Icon(
                      FontAwesomeIcons.planeDeparture,
                      color: Colors.indigo,
                      size: 28,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Bonus Tip: Consider traveling by train or bus when possible to reduce your carbon footprint.',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
