import 'package:flutter/material.dart';

class Tour2Page extends StatelessWidget {
  const Tour2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Eco-Friendly Tour 2'),
        backgroundColor: const Color(0xFF004D40),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tour 2: Eco-Resorts and Sustainable Beaches',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Relax at luxurious eco-resorts that prioritize sustainability. '
              'Enjoy pristine beaches where environmental preservation is at the forefront. '
              'This tour is perfect for those seeking both relaxation and eco-consciousness.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Highlights:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '- Stay at eco-certified resorts\n'
              '- Beach clean-up activities\n'
              '- Solar-powered accommodations\n'
              '- Organic farm-to-table dining',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
