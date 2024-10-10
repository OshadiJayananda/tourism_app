import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:tourism_app/Pages/VolunteerPages/opprtunity_details_page.dart';

class OpportunityPage extends StatefulWidget {
  const OpportunityPage({super.key});

  @override
  State<OpportunityPage> createState() => _OpportunityPageState();
}

class _OpportunityPageState extends State<OpportunityPage> {
  final DatabaseReference _opportunityRef =
      FirebaseDatabase.instance.ref('opportunities');
  Map<String, List<Map<String, String>>> categorizedOpportunities = {};
  Map<String, List<Map<String, String>>> filteredOpportunities = {};
  TextEditingController _searchController = TextEditingController();
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    _fetchOpportunities();
    _searchController.addListener(_updateSearchQuery);
  }

  Future<void> _fetchOpportunities() async {
    try {
      final snapshot = await _opportunityRef.get();

      if (snapshot.exists) {
        final data = snapshot.value as Map<dynamic, dynamic>;
        Map<String, List<Map<String, String>>> tempCategorizedOpportunities =
            {};

        data.forEach((key, value) {
          final opportunity = Map<String, String>.from(value);
          final category = opportunity['category'] ?? 'Uncategorized';

          if (!tempCategorizedOpportunities.containsKey(category)) {
            tempCategorizedOpportunities[category] = [];
          }
          tempCategorizedOpportunities[category]?.add(opportunity);
        });

        setState(() {
          categorizedOpportunities = tempCategorizedOpportunities;
          filteredOpportunities = Map.from(
              categorizedOpportunities); // Initialize filteredOpportunities
        });
      } else {
        print('No opportunities found.');
      }
    } catch (error) {
      print('Error fetching opportunities: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching opportunities: $error')),
      );
    }
  }

  void _updateSearchQuery() {
    setState(() {
      searchQuery = _searchController.text.toLowerCase();
      _filterOpportunities();
    });
  }

  void _filterOpportunities() {
    if (searchQuery.isEmpty) {
      setState(() {
        filteredOpportunities =
            Map.from(categorizedOpportunities); // Show all if no query
      });
    } else {
      Map<String, List<Map<String, String>>> tempFilteredOpportunities = {};
      categorizedOpportunities.forEach((category, opportunities) {
        if (category.toLowerCase().contains(searchQuery)) {
          tempFilteredOpportunities[category] = opportunities;
        }
      });

      setState(() {
        filteredOpportunities = tempFilteredOpportunities;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
        title: TextField(
          controller: _searchController,
          decoration: const InputDecoration(
            hintText: 'Search for opportunities by category',
            prefixIcon: Icon(Icons.search, color: Colors.white),
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(12.0),
          ),
          style: const TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {
            // Handle menu button press
          },
        ),
      ),
      body: Column(
        children: [
          // Add the volunteering image here
          // SizedBox(
          //   width: double.infinity, // Make image full width
          //   height: 180, // Adjust height as needed
          //   child: ClipRect(
          //     child: Align(
          //       // alignment: Alignment.topCenter, // Adjust from top or bottom
          //       heightFactor:
          //           0.7, // Adjust this to control how much of the image is visible
          //       child: Image.asset(
          //         'assets/images/volunteering_img2.jpeg', // Your image path
          //         fit: BoxFit
          //             .cover, // Ensure the image covers the area proportionally
          //       ),
          //     ),
          //   ),
          // ),

          SizedBox(
            width: double.infinity,
            height: 180, // You can adjust the height as needed
            child: Image.asset(
              'assets/images/volunteering_img2.jpeg', // Path to your asset image
              fit: BoxFit.cover,
            ),
          ),
          // Divider line or space after image
          const SizedBox(height: 10),
                              Text(
                      "Explore Eco-Friendly Volunteer Opportunities",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: const Color.fromARGB(255, 0, 88, 79),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Make a difference by contributing to the environment!",
                      style: TextStyle(
                        fontSize: 16,
                        color: const Color.fromARGB(255, 0, 88, 79),
                      ),
                    ),

                    SizedBox(height: 10),
          // The main body: opportunity list
          Expanded(
            child: filteredOpportunities.isEmpty
                ? Center(
                    child: searchQuery.isEmpty
                        ? const CircularProgressIndicator()
                        : const Text(
                            'No opportunity type',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.teal),
                          ),
                  )
                : ListView.builder(
                    itemCount: filteredOpportunities.keys.length,
                    itemBuilder: (context, index) {
                      final category =
                          filteredOpportunities.keys.elementAt(index);
                      final opportunities = filteredOpportunities[category]!;

                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 4.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 5,
                          child: ExpansionTile(
                            backgroundColor: Colors.white,
                            title: Row(
                              children: [
                                const Icon(Icons.category, color: Colors.teal),
                                const SizedBox(width: 8),
                                Text(
                                  category,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.teal,
                                  ),
                                ),
                              ],
                            ),
                            children: opportunities.map((opportunity) {
                              return _buildOpportunityCard(opportunity);
                            }).toList(),
                          ),
                        ),
                      );
                    },
                  ),
          ),
          
        ],
      ),
    );
  }

  Widget _buildOpportunityCard(Map<String, String> opportunity) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 6,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (opportunity.containsKey('image'))
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(15.0)),
              child: Image.network(
                opportunity['image']!,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Opportunity Title
                Text(
                  opportunity['name'] ?? 'Unnamed Opportunity',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 12),

                // Date
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.calendar_today, color: Colors.teal),
                    const SizedBox(width: 8),
                    Text(
                      'Date: ',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: Text(
                        opportunity['date'] ?? 'No date available',
                        style: const TextStyle(
                            color: Colors.teal, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                // Location
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.location_on, color: Colors.teal),
                    const SizedBox(width: 8),
                    Text(
                      'Location: ',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: Text(
                        opportunity['location'] ?? 'No location',
                        style: const TextStyle(
                            color: Colors.teal, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                // Check-in Time
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.access_time, color: Colors.teal),
                    const SizedBox(width: 8),
                    Text(
                      'Check-in Time: ',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: Text(
                        opportunity['checkInTime'] ?? 'No check-in time',
                        style: const TextStyle(
                            color: Colors.teal, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                // Duration
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.timelapse, color: Colors.teal),
                    const SizedBox(width: 8),
                    Text(
                      'Duration: ',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: Text(
                        opportunity['duration'] ?? 'No duration',
                        style: const TextStyle(
                            color: Colors.teal, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Description
                Text(
                  'Description:',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  opportunity['description'] ?? 'No description',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),

                // Organizer's Contact Number
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.phone, color: Colors.teal),
                    const SizedBox(width: 8),
                    Text(
                      'Contact Number: ',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: Text(
                        opportunity['contactNumber'] ?? 'No contact available',
                        style: const TextStyle(
                            color: Colors.teal, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Button for More Details
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Applied for ${opportunity['name']}'),
                          ),
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OpportunityDetailsPage(
                              opportunityTitle: opportunity['name']!,
                            ),
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
                        _contactOrganizer(
                            context, opportunity['contactNumber']!);
                      },
                      icon: const Icon(Icons.contact_phone),
                      label: const Text('Contact Organizer'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orangeAccent,
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
  }

  void _contactOrganizer(BuildContext context, String contactNumber) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Calling organizer at $contactNumber')),
    );
    // Add logic to initiate a call using a package like url_launcher
  }
}