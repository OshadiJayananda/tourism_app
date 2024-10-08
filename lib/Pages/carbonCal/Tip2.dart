import 'package:flutter/material.dart';

class Tip2Page extends StatelessWidget {
  const Tip2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tip 2 Details'),
        backgroundColor: const Color(0xFF004D40),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Eco-Friendly Travel Tip 2',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Choose eco-friendly transportation options such as trains, bicycles, or electric vehicles. '
              'These modes of transportation produce fewer emissions and are better for the environment.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
