import 'package:flutter/material.dart';

class PlanAndPack extends StatefulWidget {
  const PlanAndPack({super.key});

  @override
  State<PlanAndPack> createState() => _PlanAndPackState();
}

class _PlanAndPackState extends State<PlanAndPack> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plan and Pack'),
        backgroundColor: Colors.teal,
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Section Title
            const Text(
              'Packing Checklist',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            // Packing List Section
            _buildPackingItem(
              title: 'Reusable Water Bottle',
              description: 'Stay hydrated with a reusable bottle and reduce plastic waste.',
            ),
            _buildPackingItem(
              title: 'Eco-Friendly Toiletries',
              description: 'Opt for biodegradable and refillable options like soaps, shampoos, and toothbrushes.',
            ),
            _buildPackingItem(
              title: 'Reusable Shopping Bags',
              description: 'Bring your own bags to avoid using plastic when shopping locally.',
            ),
            _buildPackingItem(
              title: 'Solar-Powered Charger',
              description: 'Use solar chargers for your devices, reducing reliance on electricity.',
            ),
            _buildPackingItem(
              title: 'Clothing Made from Sustainable Materials',
              description: 'Pack clothes made from organic cotton, bamboo, or recycled materials.',
            ),
            _buildPackingItem(
              title: 'Lightweight Travel Gear',
              description: 'Choose lightweight, multipurpose gear to reduce the environmental impact of transport.',
            ),

            const SizedBox(height: 24),

            // Recommendations Section
            const Text(
              'Recommendations for Sustainable Travel',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            _buildPackingItem(
              title: 'Minimize Waste',
              description: 'Avoid single-use products and opt for items that can be reused during your trip.',
            ),
            _buildPackingItem(
              title: 'Pack Light',
              description: 'Packing light reduces the amount of fuel used in transport, minimizing your carbon footprint.',
            ),
            _buildPackingItem(
              title: 'Support Local, Eco-Friendly Brands',
              description: 'Where possible, buy eco-conscious gear from local brands to support sustainable businesses.',
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build each packing item
  Widget _buildPackingItem({required String title, required String description}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
              fontSize: 16,
              color: Colors.black54,
            ),
          ),
          const Divider(height: 20, thickness: 1),
        ],
      ),
    );
  }
}
