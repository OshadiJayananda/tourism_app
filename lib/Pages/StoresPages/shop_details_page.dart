import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tourism_app/Pages/shop_pages/messages.dart';
// Import the Messages page

class ShopDetailsPage extends StatelessWidget {
  final String label;
  final String imageUrl; // Use this for the product image
  final LatLng location; // Use this for the shop's location on the map

  const ShopDetailsPage({
    super.key,
    required this.label,
    required this.imageUrl,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(label)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Display the product image at the top
            Container(
              padding: const EdgeInsets.all(8),
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            // Display the name of the shop
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                label,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            // Map window displaying the shop's location
            SizedBox(
              height: 200, // Set a fixed height for the map
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: location,
                  zoom: 14.0,
                ),
                markers: {
                  Marker(
                    markerId: MarkerId(label),
                    position: location,
                    infoWindow: InfoWindow(title: label),
                  ),
                },
              ),
            ),
            const SizedBox(height: 10), // Space before the featured products
            // Featured Products Section
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Featured Products',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  // Example of a featured product
                  const ProductCard(
                    imageUrl:
                        'assets/images/reusable_bottle.jpg', // Add your image asset path here
                    title: 'Reusable Water Bottle',
                    price: '\$15',
                  ),
                  // Add more ProductCards as needed

                  const SizedBox(height: 10), // Add some space before the button
                  Center(
                    // Center the button
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigate to the Messages page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Messages(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding:
                            const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        textStyle: const TextStyle(fontSize: 18),
                      ),
                      child: const Text('Message'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;

  const ProductCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Image.asset(
              imageUrl,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(price, style: const TextStyle(color: Colors.green)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
