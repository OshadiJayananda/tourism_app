import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:firebase_database/firebase_database.dart'; // Import for Firebase Realtime Database
import 'package:tourism_app/Pages/shop_firebase.dart';
import 'featured_item_card.dart'; // Import your FeaturedItemCard

class FeaturedItemsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      // future: _fetchFeaturedItems(),
      future: ShopService().getFavoriteItems(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          print('Error: ${snapshot.error}');
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No items found'));
        }

        // Extract data from snapshot
        final featuredItems = snapshot.data!;

        return Row(
          children: [
            for (var item in featuredItems) ...[
              FeaturedItemCard(
                  label: item['label'],
                  price: item['price'],
                  subLabel: item['subLabel'],
                  imgUrl: item['imgUrl'],
                  location: LatLng(item['location']['latitude'],
                      item['location']['longitude'])),
              const SizedBox(width: 16), // Space between the cards
            ],
          ],
        );
      },
    );
  }
}
