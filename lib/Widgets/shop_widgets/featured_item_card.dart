import 'package:flutter/material.dart';
import '../../Pages/StoresPages/shop_details_page.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart'; // Import for LatLng

class FeaturedItemCard extends StatelessWidget {
  final String label;
  final String subLabel;
  final String price;
  final String imgUrl;
  final LatLng location; // Add location to pass to the details page

  FeaturedItemCard({
    required this.label,
    required this.subLabel,
    required this.price,
    required this.location, // Add location to constructor
    required this.imgUrl, // Add location to constructor
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the ShopDetailsPage on tap
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ShopDetailsPage(
              label: label,
              location: location, // Pass the location to the details page
              imageUrl: imgUrl,
            ),
          ),
        );
      },
      child: Container(
        height: 150,
        padding: const EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width / 2 - 20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[300],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Text(
                'New Arrival',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(subLabel, style: const TextStyle(color: Colors.grey)),
            const SizedBox(height: 8),
            Text(
              'Price: $price',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
