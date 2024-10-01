import 'package:flutter/material.dart';

class OtherAreasPage extends StatelessWidget {
  const OtherAreasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
        title: const Text('Other Volunteering Areas'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 150,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.teal,
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(40)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Explore Eco-Friendly Volunteer Opportunities",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Make a difference by contributing to the environment!",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16.0),

            // Content area below the header
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Eco-Friendly Volunteer Opportunities:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // List of eco-friendly volunteering opportunities with icons
                  OpportunityTile(
                    opportunity: "Wildlife Conservation Project - Ongoing",
                    icon: Icons.pets, // Example icon for Wildlife Conservation
                  ),
                  OpportunityTile(
                    opportunity: "Community Clean-up Event - Every Saturday",
                    icon: Icons.cleaning_services, // Example icon for Clean-up Event
                  ),
                  OpportunityTile(
                    opportunity: "Tree Planting Initiative - Monthly",
                    icon: Icons.park, // Example icon for Tree Planting
                  ),
                  OpportunityTile(
                    opportunity: "Sustainable Agriculture Workshops - Weekly",
                    icon: Icons.agriculture, // Example icon for Agriculture
                  ),
                  OpportunityTile(
                    opportunity:
                        "Renewable Energy and Environmental Education - Weekly",
                    icon: Icons.energy_savings_leaf, // Example icon for Energy & Education
                  ),
                  OpportunityTile(
                    opportunity:
                        "National Park Preservation and Ecotourism Development - Monthly",
                    icon: Icons.nature, // Example icon for Park Preservation
                  ),
                  OpportunityTile(
                    opportunity:
                        "Recycling and Waste Management Awareness Campaign - Quarterly",
                    icon: Icons.recycling, // Example icon for Recycling Campaign
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OpportunityTile extends StatelessWidget {
  final String opportunity;
  final IconData icon; // Add icon property

  const OpportunityTile({
    Key? key,
    required this.opportunity,
    required this.icon, // Require icon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3, // Add elevation for shadow effect
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.teal), // Display the icon
        title: Text(
          opportunity,
          style: const TextStyle(fontSize: 16),
        ),
        contentPadding: const EdgeInsets.all(16),
      ),
    );
  }
}
