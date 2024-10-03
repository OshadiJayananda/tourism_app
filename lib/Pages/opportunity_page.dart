import 'package:flutter/material.dart';

class OpportunityPage extends StatelessWidget {
  const OpportunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data for opportunities
    final List<Map<String, String>> opportunities = [
      {
        'title': 'Beach Cleanup Coordinator',
        'location': 'Miami Beach, FL',
        'description': 'Lead a team of volunteers to clean up beaches.',
        'image': 'assets/images/beach_cleanup.jpg',
        'organizer': 'John Doe'
      },
      {
        'title': 'Marine Wildlife Protection',
        'location': 'San Diego, CA',
        'description': 'Help protect marine wildlife along the shore.',
        'image': 'assets/images/marine_wildlife.jpg',
        'organizer': 'Jane Smith'
      },
      {
        'title': 'Public Awareness Campaign',
        'location': 'Santa Monica, CA',
        'description': 'Educate beachgoers on the importance of beach conservation.',
        'image': 'assets/images/public_awareness.jpg',
        'organizer': 'Paul Johnson'
      },
    ];

    return Scaffold(
          appBar: AppBar(
        backgroundColor: Colors.teal,
        
        elevation: 0,
        title: const TextField(
          decoration: InputDecoration(
            hintText: 'Search for opportunities',
            prefixIcon: Icon(Icons.search),
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(12.0),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            // Handle menu button press
          },
        ),
      ),
      body: ListView.builder(
        itemCount: opportunities.length,
        itemBuilder: (context, index) {
          final opportunity = opportunities[index];

          return Card(
            margin: const EdgeInsets.all(16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Opportunity image
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(10.0),
                  ),
                  child: Image.asset(
                    opportunity['image']!,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Opportunity title
                      Text(
                        opportunity['title']!,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),

                      // Location
                      Row(
                        children: [
                          const Icon(Icons.location_on, color: Colors.teal),
                          const SizedBox(width: 5),
                          Text(opportunity['location']!),
                        ],
                      ),
                      const SizedBox(height: 8),

                      // Description
                      Text(
                        opportunity['description']!,
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 16),

                      // Buttons: Apply and Contact Organizer
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {
                              // Handle apply action
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      'Applied for ${opportunity['title']}'),
                                ),
                              );
                            },
                            icon: const Icon(Icons.check_circle),
                            label: const Text('Apply Now'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.teal,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                                vertical: 12.0,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                          ElevatedButton.icon(
                            onPressed: () {
                              // Handle contact action
                              _contactOrganizer(context, opportunity['organizer']!);
                            },
                            icon: const Icon(Icons.contact_phone),
                            label: const Text('Contact Organizer'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.teal,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                                vertical: 12.0,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // Method to contact the organizer
  void _contactOrganizer(BuildContext context, String organizerName) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Contact $organizerName'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Phone: +1 123-456-7890'),
            const Text('Email: organizer@example.com'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}
