import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ShopDetailsPage extends StatelessWidget {
  final String label;
  final String imageUrl; // Use this for the product image
  final LatLng location; // Use this for the shop's location on the map

  const ShopDetailsPage({
    Key? key,
    required this.label,
    required this.imageUrl,
    required this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(label)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Display the product image at the top
            Container(
              padding: EdgeInsets.all(8),
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
            // Display the name of the shop
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                label,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            // Map window displaying the shop's location
            Container(
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
            SizedBox(height: 10), // Space before the featured products
            // Featured Products Section
            Container(
              padding: EdgeInsets.all(16.0),
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
                  SizedBox(height: 10),
                  // Example of a featured product
                  const ProductCard(
                    imageUrl:
                        'assets/images/reusable_bottle.jpg', // Add your image asset path here
                    title: 'Reusable Water Bottle',
                    price: '\$15',
                  ),
                  // Add more ProductCards as needed

                  SizedBox(height: 10), // Add some space before the button
                  Center(
                    // Center the button
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle button press (e.g., navigate to message screen or open chat)
                        print('Message button pressed');
                      },
                      child: Text('Message'),
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        textStyle: TextStyle(fontSize: 18),
                      ),
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
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Image.asset(
              imageUrl,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(price, style: TextStyle(color: Colors.green)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
