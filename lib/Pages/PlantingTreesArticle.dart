import 'package:flutter/material.dart';



// Article for Planting Trees
class PlantingTreesArticle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Planting Trees - Nature's Air Filters"),
        backgroundColor: Color(0xFF009688),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Planting Trees: A Gift to the Planet",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                "Planting trees is one of the most effective ways to combat climate change. Trees absorb carbon dioxide and release oxygen, making our air cleaner and healthier. Moreover, they provide shelter to countless species and enhance biodiversity.",
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              SizedBox(height: 16),
              Image.network(
                'https://example.com/planting_trees.jpg', // Replace with a valid image URL
                height: 200,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 16),
              Text(
                "Why Plant Trees?",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "1. **Air Quality Improvement**: Trees filter pollutants and dust from the air, making it cleaner.\n"
                "2. **Wildlife Habitat**: Trees provide a home for numerous species of birds, insects, and mammals.\n"
                "3. **Climate Regulation**: Trees play a critical role in moderating the Earth's climate by reducing heat and conserving water.",
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              SizedBox(height: 16),
              Text(
                "How to Get Involved",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "Join local initiatives or start your own tree-planting project. Here are a few tips to make an impact:\n"
                "- Organize community planting events.\n"
                "- Educate others about the importance of trees.\n"
                "- Share your experiences on social media to inspire more people.",
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
