import 'package:flutter/material.dart';

class ReviewCard extends StatelessWidget {
  final String name;
  final String review;
  final int rating;
  final String imageUrl; // URL or asset path for the reviewer's image

  const ReviewCard({
    super.key,
    required this.name,
    required this.review,
    required this.rating,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Card(
        elevation: 4,
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: imageUrl.startsWith('http')
                ? NetworkImage(imageUrl) // Load user's image from network
                : AssetImage(imageUrl)
                    as ImageProvider, // Load user's image from assets
          ),
          title: Text(name),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(review),
              const SizedBox(height: 4),
              Row(
                children: List.generate(5, (starIndex) {
                  return Icon(
                    starIndex < rating ? Icons.star : Icons.star_border,
                    color: Colors.teal,
                    size: 16,
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
