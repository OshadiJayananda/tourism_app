import 'package:flutter/material.dart';
import '../widgets/volunteer_category.dart';
import '../widgets/opportunity_card.dart';

class TvolunteerPage extends StatefulWidget {
  const TvolunteerPage({super.key});

  @override
  State<TvolunteerPage> createState() => _TvolunteerPageState();
}

class _TvolunteerPageState extends State<TvolunteerPage> {
  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(40)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        VolunteerCategory(icon: Icons.beach_access, label: "Beach Volunteering"),
                        VolunteerCategory(icon: Icons.bloodtype, label: "Blood Donation"),
                        VolunteerCategory(icon: Icons.more_horiz, label: "Other Areas"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Available Opportunities',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            GridView.count(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              shrinkWrap: true,
              crossAxisCount: 2,
              childAspectRatio: 0.7,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                OpportunityCard(
                  imageUrl: 'https://example.com/beach.jpg',
                  title: 'Beach Cleanup',
                  location: 'Sunny Beach',
                ),
                OpportunityCard(
                  imageUrl: 'https://example.com/wildlife.jpg',
                  title: 'Wildlife Camping',
                  location: 'Forest Reserve',
                ),
              ],
            ),
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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle Apply button press
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
