import 'package:flutter/material.dart';


// Article for Public Transport
class PublicTransportArticle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Public Transport - A Sustainable Choice"),
        backgroundColor: Color(0xFF009688),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Public Transport: Your Green Travel Option",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                "Public transport is an essential part of sustainable urban living. By choosing buses, trains, and subways, we can significantly reduce our carbon footprint and alleviate traffic congestion.",
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              SizedBox(height: 16),
              Image.network(
                'https://example.com/public_transport.jpg', // Replace with a valid image URL
                height: 200,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 16),
              Text(
                "Benefits of Public Transport",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "1. **Reduced Emissions**: Public transport produces fewer greenhouse gases per passenger compared to private vehicles.\n"
                "2. **Cost-effective**: Using public transport can save you money on fuel, parking, and maintenance.\n"
                "3. **Less Traffic Congestion**: Fewer cars on the road lead to smoother traffic flow and shorter travel times.",
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              SizedBox(height: 16),
              Text(
                "How to Use Public Transport Effectively",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "Here are some tips for getting the most out of your public transport experience:\n"
                "- Plan your routes using apps or websites.\n"
                "- Be mindful of peak hours to avoid overcrowding.\n"
                "- Respect fellow passengers and keep the environment clean.",
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
