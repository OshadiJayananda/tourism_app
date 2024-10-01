import 'package:flutter/material.dart';

class BloodDonationPage extends StatelessWidget {
  const BloodDonationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Blood Donation Opportunities"),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Why Donate Blood?",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Donating blood is a generous act that can save lives. It is essential for surgeries, trauma care, and cancer treatment. Your donation can make a significant difference in the lives of those in need.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Image.asset(
              'assets/images/blood_donate.jpg',
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            const Text(
              "Available Opportunities:",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 10),
            // List of opportunities
            OpportunityTile(
              leading: Icon(Icons.volunteer_activism),
              opportunity: "Community Blood Drive at City Hall - 10 AM to 4 PM, October 15th",
            ),
            OpportunityTile(
              leading: Icon(Icons.volunteer_activism),
              opportunity: "Blood Donation Camp at Local High School - 9 AM to 3 PM, October 20th",
            ),
            OpportunityTile(
              leading: Icon(Icons.volunteer_activism),
              opportunity: "Annual Blood Donation Event at Community Center - 8 AM to 6 PM, October 30th",
            ),
            // Add more opportunities as needed
          ],
        ),
      ),
    );
  }
}

class OpportunityTile extends StatelessWidget {
  final String opportunity;
  final Widget leading; // Added leading parameter

  const OpportunityTile({
    Key? key,
    required this.opportunity,
    required this.leading, // Ensure leading is a required parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile( // Use ListTile for leading icons
        leading: leading,
        title: Text(
          opportunity,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
