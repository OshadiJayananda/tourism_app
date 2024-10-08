import 'package:flutter/material.dart';

class Tip1Page extends StatelessWidget {
  const Tip1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tip 1 Details'),
        backgroundColor: const Color(0xFF004D40),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Eco-Friendly Travel Tip 1',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Pack light! The heavier your luggage, the more fuel your transportation will use. '
              'Opt for eco-friendly and reusable items wherever possible, such as refillable water bottles and cloth bags.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
