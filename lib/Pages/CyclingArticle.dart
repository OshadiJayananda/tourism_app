import 'package:flutter/material.dart';

// Article for Cycling
class CyclingArticle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cycling - Eco-Friendly Transport"),
        backgroundColor: Color(0xFF009688),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Cycling: A Healthy and Eco-Friendly Choice",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                "Cycling is not only a great form of exercise, but it's also an environmentally friendly mode of transport. With zero emissions, it helps reduce air pollution while promoting a healthier lifestyle.",
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              SizedBox(height: 16),
              Image.network(
                'https://example.com/cycling.jpg', // Replace with a valid image URL
                height: 200,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 16),
              Text(
                "Advantages of Cycling",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "1. **Health Benefits**: Regular cycling can improve cardiovascular fitness, muscle strength, and flexibility.\n"
                "2. **Environmental Impact**: Biking reduces the need for fossil fuels, decreasing greenhouse gas emissions.\n"
                "3. **Cost-effective**: Cycling eliminates the costs associated with car ownership and fuel.",
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              SizedBox(height: 16),
              Text(
                "Tips for Safe Cycling",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "To ensure a safe cycling experience, consider the following:\n"
                "- Always wear a helmet and reflective gear.\n"
                "- Follow traffic laws and signals.\n"
                "- Use bike lanes where available, and be aware of your surroundings.",
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
