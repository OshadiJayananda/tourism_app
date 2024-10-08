import 'package:flutter/material.dart';

class Tour1Page extends StatelessWidget {
  const Tour1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Eco-Friendly Tour 1'),
        backgroundColor: const Color(0xFF004D40),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tour 1: Sustainable Wildlife Exploration',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Embark on a journey through the heart of nature with our sustainable wildlife tour. '
              'This eco-friendly expedition takes you through lush forests and protected habitats, all while ensuring minimal environmental impact.',
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
              '- Explore diverse wildlife\n'
              '- Stay at eco-friendly lodges\n'
              '- Engage in conservation efforts\n'
              '- Low-carbon transport options',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
