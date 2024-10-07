import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:firebase_database/firebase_database.dart'; // Import for Firebase Realtime Database
import 'featured_item_card.dart'; // Import your FeaturedItemCard

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

  // Future<List<Map<String, dynamic>>> _fetchFeaturedItems()

  Future<List<Map<String, dynamic>>> getFavoriteItems() async {
    DatabaseReference shopRef =
        FirebaseDatabase.instance.ref().child('new-shops');
    DataSnapshot snapshot = await shopRef.get();

    final List<Map<String, dynamic>> favoriteItems = [];

    // if (snapshot.exists) {
    //   Map<dynamic, dynamic> shops = snapshot.value as Map<dynamic, dynamic>;

    //   for (var shop in shops.values) {
    //     if (shop['items'] != null) {
    //       for (var item in shop['items']) {
    //         if (item['isFavorite'] == true) {
    //           favoriteItems.add(item);
    //         }
    //       }
    //     }
    //   }
    // }

    // return favoriteItems;
    // Check if the snapshot has any data
    if (snapshot.exists) {
      // Iterate through the items in the snapshot
      Map<dynamic, dynamic> shops = snapshot.value as Map<dynamic, dynamic>;
      shops.forEach((key, value) {
        if (value['items'] != null) {
          List<dynamic> items = value['items'];
          for (var item in items) {
            // Check if the item is marked as favorite
            if (item['isFavorite'] == true) {
              // Add the item to the favoriteItems list
              favoriteItems.add({
                'imgUrl': item['imgUrl'],
                'label': item['label'],
                'price': item['price'],
                'subLabel': item['subLabel'],
                'location': value['location'],
              });
            }
          }
        }
      });
    }

    // Print the favorite items or handle them as needed
    print(favoriteItems);
    return favoriteItems;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      // future: _fetchFeaturedItems(),
      future: getFavoriteItems(),
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
                  // location: item['location'],
                  location : LatLng(item['location']['latitude'],
                      item['location']['longitude'])),
              const SizedBox(width: 16), // Space between the cards
            ],
          ],
        );
      },
    );
  }
}
