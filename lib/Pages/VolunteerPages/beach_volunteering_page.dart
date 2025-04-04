import 'package:flutter/material.dart';
import 'opportunity_page.dart'; // Import the OpportunityPage

class BeachVolunteeringPage extends StatelessWidget {
  const BeachVolunteeringPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beach Volunteering'),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Beach Volunteering description
              const Text(
                'Beach Volunteering',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Join our beach volunteering program and help preserve the beauty of our beaches. Activities include cleaning, educating the public, and supporting wildlife protection efforts.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),

              // Beach image
              Image.asset(
                'assets/images/beach_volunteering.jpeg',
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),

              // List of opportunities
              const Text(
                'Beach Volunteering Opportunities:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  ListTile(
                    leading: Icon(Icons.volunteer_activism),
                    title: Text('Beach Cleanup Coordinator'),
                    subtitle: Text('Lead a team of volunteers to clean up beaches.'),
                  ),
                  ListTile(
                    leading: Icon(Icons.volunteer_activism),
                    title: Text('Marine Wildlife Protection'),
                    subtitle: Text('Help protect marine wildlife on the beach.'),
                  ),
                  ListTile(
                    leading: Icon(Icons.volunteer_activism),
                    title: Text('Public Awareness Campaign'),
                    subtitle: Text('Educate beachgoers on the importance of conservation.'),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // See all available opportunities button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to the OpportunityPage
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const OpportunityPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text(
                    'See All Available Opportunities',
                    style: TextStyle(fontSize: 16),
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
