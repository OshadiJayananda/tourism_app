import 'package:flutter/material.dart';

// Article for Walking
class WalkingArticle extends StatelessWidget {
  const WalkingArticle({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Walking - A Sustainable Choice"),
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
                "Walking: A Path to Sustainability",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF00695C), // Darker shade of teal for the main title
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Walking is more than just a means of transportation; it's a lifestyle choice that significantly reduces your carbon footprint. By choosing to walk, you not only help the environment but also enhance your health and well-being.",
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 16),
              Center(
                child: Image.asset(
                  'assets/images/walking.jpg', // Path to your illustration
                  height: 200, // Adjust height as needed
                  width: 300, // Adjust width as needed
                  fit: BoxFit.cover, // Cover to maintain aspect ratio
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Health Benefits of Walking",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF00796B), // Lighter shade of teal for section titles
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "1. Boosts Mood: Walking releases endorphins, helping to reduce stress and improve your mood.\n"
                "2. Improves Fitness: Regular walking strengthens your heart, improves circulation, and helps maintain a healthy weight.\n"
                "3. Connects You to Nature: Walking in green spaces can rejuvenate your mind and enhance your sense of well-being.",
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 16),
              const Text(
                "Sustainable Practices",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF00796B), // Lighter shade of teal for section titles
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "To make your walking journey even more sustainable, consider the following:\n"
                "- Choose scenic routes to enjoy nature and motivate yourself.\n"
                "- Join community walking groups to encourage others.\n"
                "- Use eco-friendly footwear and accessories.",
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
