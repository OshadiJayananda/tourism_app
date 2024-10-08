import 'package:flutter/material.dart';

// Article for Walking
class WalkingArticle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Walking - A Sustainable Choice"),
        backgroundColor: Color(0xFF009688),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Walking: A Path to Sustainability",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                "Walking is more than just a means of transportation; it's a lifestyle choice that significantly reduces your carbon footprint. By choosing to walk, you not only help the environment but also enhance your health and well-being.",
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              SizedBox(height: 16),
              Image.network(
                'https://example.com/walking.jpg', // Replace with a valid image URL
                height: 200,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 16),
              Text(
                "Health Benefits of Walking",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "1. **Boosts Mood**: Walking releases endorphins, helping to reduce stress and improve your mood.\n"
                "2. **Improves Fitness**: Regular walking strengthens your heart, improves circulation, and helps maintain a healthy weight.\n"
                "3. **Connects You to Nature**: Walking in green spaces can rejuvenate your mind and enhance your sense of well-being.",
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              SizedBox(height: 16),
              Text(
                "Sustainable Practices",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "To make your walking journey even more sustainable, consider the following:\n"
                "- Choose scenic routes to enjoy nature and motivate yourself.\n"
                "- Join community walking groups to encourage others.\n"
                "- Use eco-friendly footwear and accessories.",
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Back to Eco-friendly Options"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF009688),
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
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

