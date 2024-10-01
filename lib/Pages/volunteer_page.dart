import 'package:flutter/material.dart';
import '../widgets/volunteer_category.dart';

class VolunteerPage extends StatefulWidget {
  const VolunteerPage({super.key});

  @override
  State<VolunteerPage> createState() => _VolunteerPageState();
}

class _VolunteerPageState extends State<VolunteerPage> {
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
              child: const Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    VolunteerCategory(
                      icon: Icons.beach_access,
                      label: "Beach Volunteering",
                      // onTap: () {
                      //   print("Beach Volunteering tapped");
                      // },
                    ),
                    VolunteerCategory(
                      icon: Icons.bloodtype,
                      label: "Blood Donation",
                      // onTap: () {
                      //   print("Blood Donation tapped");
                      // },
                    ),
                    VolunteerCategory(
                      icon: Icons.more_horiz,
                      label: "Other Areas",
                      // onTap: () {
                      //   _showOtherAreasDialog();
                      // },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showOtherAreasDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Other Areas of Volunteering"),
          content: const Text(
            "1. Wildlife Conservation\n"
            "2. Sustainable Agriculture\n"
            "3. Community Development\n...",
          ),
          actions: <Widget>[
            TextButton(
              child: const Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
