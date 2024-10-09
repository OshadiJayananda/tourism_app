import 'package:flutter/material.dart';

// Article for Cycling
class CyclingArticle extends StatelessWidget {
  const CyclingArticle({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cycling - Eco-Friendly Transport"),
        backgroundColor: const Color(0xFF009688),
        centerTitle: true, // Centering the title for a balanced look
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Cycling: A Healthy and Eco-Friendly Choice",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF00695C), // A darker shade of teal
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Cycling is not only a great form of exercise, but it's also an environmentally friendly mode of transport. With zero emissions, it helps reduce air pollution while promoting a healthier lifestyle.",
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 16),
              Center(
                child: Image.asset(
                  'assets/images/cycling.jpg', // Path to your illustration
                  height: 200, // Adjust height as needed
                  width: 300, // Adjust width as needed
                  fit: BoxFit.cover, // Cover to maintain aspect ratio
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Advantages of Cycling",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF00796B), // A lighter shade of teal
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "1. Health Benefits: Regular cycling can improve cardiovascular fitness, muscle strength, and flexibility.\n"
                "2. Environmental Impact: Biking reduces the need for fossil fuels, decreasing greenhouse gas emissions.\n"
                "3. Cost-effective: Cycling eliminates the costs associated with car ownership and fuel.",
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 16),
              const Text(
                "Tips for Safe Cycling",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF00796B), // A lighter shade of teal
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "To ensure a safe cycling experience, consider the following:\n"
                "- Always wear a helmet and reflective gear.\n"
                "- Follow traffic laws and signals.\n"
                "- Use bike lanes where available, and be aware of your surroundings.",
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
