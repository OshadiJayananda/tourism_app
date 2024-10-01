import 'package:flutter/material.dart';
import 'package:tourism_app/Pages/blood_donation_page.dart';
import 'package:tourism_app/Pages/other_areas_page.dart';
import '../widgets/volunteer_category.dart';
import '../widgets/review_card.dart'; // Import the ReviewCard widget
import 'volunteer_application_page.dart';
import 'beach_volunteering_page.dart'; // Import the BeachVolunteeringPage

class VolunteerPage extends StatefulWidget {
  const VolunteerPage({super.key});

  @override
  State<VolunteerPage> createState() => _VolunteerPageState();
}

class _VolunteerPageState extends State<VolunteerPage> {
  // Example list of user reviews with image asset paths
  final List<Map<String, dynamic>> userReviews = [
    {
      'name': 'Alice Johnson',
      'review':
          'This app has been a great help during my volunteering trips. It makes finding opportunities super easy!',
      'rating': 5,
      'imageUrl': 'assets/images/alliceJ.jpeg', // Asset path for Alice
    },
    {
      'name': 'Michael Smith',
      'review':
          'I love how I can easily apply for eco-friendly volunteering tasks while traveling!',
      'rating': 4,
      'imageUrl': 'assets/images/MichaelS.jpeg', // Asset path for Michael
    },
    {
      'name': 'Sophie Lee',
      'review':
          'Great app for travelers looking to make a difference. It’s user-friendly and well-designed.',
      'rating': 5,
      'imageUrl': 'assets/images/SophieL.jpeg', // Asset path for Sophie
    },
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Available Opportunities'),
        backgroundColor: Colors.teal,








        
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.teal,
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(40)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        VolunteerCategory(
                          icon: Icons.beach_access,
                          label: "Beach Volunteering",
                          onTap: () {
                            // Navigate to BeachVolunteeringPage
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    const BeachVolunteeringPage(),
                              ),
                            );
                          },
                        ),
                        VolunteerCategory(
                          icon: Icons.bloodtype,
                          label: "Blood Donation",
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const BloodDonationPage()),
                            );
                          },
                        ),
                        VolunteerCategory(
                          icon: Icons.more_horiz,
                          label: "Other Areas",
                            onTap: () {
    // Navigate to OtherAreasPage
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const OtherAreasPage(),
      ),
    );
  },// No action for this category
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // User Reviews Section
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'User Reviews',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),

            // Displaying Reviews using ReviewCard widget
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: userReviews.length,
              itemBuilder: (context, index) {
                final review = userReviews[index];
                return ReviewCard(
                  name: review['name'],
                  review: review['review'],
                  rating: review['rating'],
                  imageUrl: review['imageUrl'],
                );
              },
            ),

            // Apply Button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const VolunteerApplicationPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                  ),
                  child: const Text(
                    'Apply Volunteering',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  

}
