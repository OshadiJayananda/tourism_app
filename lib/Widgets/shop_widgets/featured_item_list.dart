import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:firebase_database/firebase_database.dart';
import 'featured_item_card.dart';

class FeaturedItemsList extends StatelessWidget {
  Future<List<Map<String, dynamic>>> _fetchFeaturedItems() async {
    DatabaseReference shopRef = FirebaseDatabase.instance.ref().child('shops');
    DataSnapshot snapshot = await shopRef.get();

    if (snapshot.exists) {
      // Convert DataSnapshot to List of Map<String, dynamic>
      final List<Map<String, dynamic>> items = [];
      final dynamic data = snapshot.value;

      // Iterate through the snapshot to populate the list
      for (var key in (data as Map).keys) {
        items.add({
          'id': key, // Save item ID
          'label': data[key]['label'],
          'subLabel': data[key]['subLabel'],
          'price': data[key]['price'],
          'imgUrl': data[key]['imgUrl'],
          'location': LatLng(
            data[key]['location']['latitude'],
            data[key]['location']['longitude'],
          ),
        });
      }

      return items;
    } else {
      throw Exception('No items found');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: _fetchFeaturedItems(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
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
                location: item['location'],
              ),
              const SizedBox(width: 16),
            ],
          ],
        );
      },
    );
  }
}
