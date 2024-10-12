import 'package:flutter/material.dart';
import 'package:tourism_app/Pages/VolunteerPages/LoginHours.dart';
import 'package:tourism_app/Pages/VolunteerPages/checkIn_page.dart';
import 'package:tourism_app/Pages/VolunteerPages/connLocatContact.dart';
import 'package:tourism_app/Pages/VolunteerPages/contactVolunteers.dart';
import 'package:tourism_app/Pages/VolunteerPages/planandPack.dart';
import 'package:tourism_app/Pages/projectDetails.dart';
import 'package:tourism_app/Pages/VolunteerPages/reviewConfirmation.dart';
import 'package:tourism_app/Pages/VolunteerPages/reviewResourses.dart';
import 'package:tourism_app/Pages/VolunteerPages/volunteer_history.dart';

class OpportunityDetailsPage extends StatelessWidget {
  final String opportunityTitle;

  OpportunityDetailsPage({required this.opportunityTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(opportunityTitle),
        backgroundColor: Colors.teal,
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Button aligned to the right
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Navigate to VolunteerHistory Page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => VolunteerHistory()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal, // Set background color
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 8.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Text(
                    'My Projects',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Grid buttons
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                children: [
                  _buildGridButton(
                    icon: Icons.assignment,
                    label: 'Review Confirmation Details',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ReviewConfirmation()),
                      );
                    },
                  ),
                  _buildGridButton(
                    icon: Icons.folder_open,
                    label: 'Review Pre-Trip Resources',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ReviewResources()),
                      );
                    },
                  ),
                  _buildGridButton(
                    icon: Icons.backpack,
                    label: 'Plan and Pack',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PlanAndPack()),
                      );
                    },
                  ),
                  _buildGridButton(
                    icon: Icons.calendar_today,
                    label: 'Project Details',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProjectDetails()),
                      );
                    },
                  ),
                  _buildGridButton(
                    icon: Icons.check_circle,
                    label: 'Check In',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CheckinPage()),
                      );
                    },
                  ),
                  _buildGridButton(
                    icon: Icons.access_time,
                    label: 'Log Hours',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Loginhours()),
                      );
                    },
                  ),
                  _buildGridButton(
                    icon: Icons.phone,
                    label: 'Communicate with Local Contacts',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Connlocatcontact()),
                      );
                    },
                  ),
                  _buildGridButton(
                    icon: Icons.group,
                    label: 'Connect with Volunteers',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Contactvolunteers()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Method to build each grid button
  Widget _buildGridButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        padding: const EdgeInsets.all(16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      onPressed: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: Colors.teal),
          const SizedBox(height: 10),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
