import 'package:flutter/material.dart';

class ReviewResources extends StatefulWidget {
  const ReviewResources({super.key});

  @override
  State<ReviewResources> createState() => _ReviewResourcesState();
}

class _ReviewResourcesState extends State<ReviewResources> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pre-Trip Resources'),
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
              'Eco-Friendly Travel Tips',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            // Travel Tips Section
            _buildResourceItem(
              title: 'Reduce Plastic Use',
              description: 'Bring a reusable water bottle, avoid single-use plastics, and consider eco-friendly alternatives when packing.',
            ),
            _buildResourceItem(
              title: 'Minimize Carbon Footprint',
              description: 'Use public transport or carpool, and try to offset your carbon emissions when flying.',
            ),
            _buildResourceItem(
              title: 'Sustainable Accommodation',
              description: 'Choose eco-friendly accommodations that use renewable energy and promote local culture.',
            ),

            const SizedBox(height: 24),

            // Packing Lists Section
            const Text(
              'Packing List',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            _buildResourceItem(
              title: 'Clothing',
              description: 'Pack lightweight, eco-friendly clothing that can be easily washed and reused.',
            ),
            _buildResourceItem(
              title: 'Eco-Friendly Toiletries',
              description: 'Opt for biodegradable soaps, bamboo toothbrushes, and refillable toiletry bottles.',
            ),

            const SizedBox(height: 24),

            // Safety Guidelines
            const Text(
              'Safety Guidelines',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            _buildResourceItem(
              title: 'Stay Aware of Local Laws',
              description: 'Research local customs and laws to ensure you are respectful and informed during your trip.',
            ),
            _buildResourceItem(
              title: 'First-Aid and Health',
              description: 'Carry a basic first-aid kit, and make sure you have necessary vaccinations and medications.',
            ),

            const SizedBox(height: 24),

            // Environmental Protection Strategies
            const Text(
              'Environmental Protection Strategies',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            _buildResourceItem(
              title: 'Leave No Trace',
              description: 'Ensure you leave the environment as you found it. Don’t leave any waste behind.',
            ),
            _buildResourceItem(
              title: 'Support Local Conservation Efforts',
              description: 'Participate in conservation projects or donate to local environmental initiatives.',
            ),

            const SizedBox(height: 24),

            // Cultural Information
            const Text(
              'Cultural Information',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            _buildResourceItem(
              title: 'Learn Local Etiquette',
              description: 'Understand the cultural norms and practices of the local community to show respect and sensitivity.',
            ),
            _buildResourceItem(
              title: 'Support Local Businesses',
              description: 'Shop locally, eat local cuisine, and support small businesses to contribute to the community economy.',
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build each resource item
  Widget _buildResourceItem({required String title, required String description}) {
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
