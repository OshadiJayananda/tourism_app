import 'package:flutter/material.dart';

// Article for Public Transport
class PublicTransportArticle extends StatelessWidget {
  const PublicTransportArticle({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Public Transport - A Sustainable Choice"),
        backgroundColor: const Color(0xFF009688),
        centerTitle: true, // Centering the title for balance
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Public Transport: Your Green Travel Option",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF00695C), // Darker shade of teal for the main title
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Public transport is an essential part of sustainable urban living. By choosing buses, trains, and subways, we can significantly reduce our carbon footprint and alleviate traffic congestion.",
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 16),
              Center(
                child: Image.asset(
                  'assets/images/publicTransport.jpg', // Path to your illustration
                  height: 200, // Adjust height as needed
                  width: 300, // Adjust width as needed
                  fit: BoxFit.cover, // Cover to maintain aspect ratio
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Benefits of Public Transport",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF00796B), // Lighter shade of teal for section titles
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "1. Reduced Emissions: Public transport produces fewer greenhouse gases per passenger compared to private vehicles.\n"
                "2. Cost-effective: Using public transport can save you money on fuel, parking, and maintenance.\n"
                "3. Less Traffic Congestion: Fewer cars on the road lead to smoother traffic flow and shorter travel times.",
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 16),
              const Text(
                "How to Use Public Transport Effectively",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF00796B), // Lighter shade of teal for section titles
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Here are some tips for getting the most out of your public transport experience:\n"
                "- Plan your routes using apps or websites.\n"
                "- Be mindful of peak hours to avoid overcrowding.\n"
                "- Respect fellow passengers and keep the environment clean.",
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF009688),
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // Rounded button
                    ),
                  ),
                  child: const Text(
                    "Back to Eco-friendly Options",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // White text for better contrast
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
