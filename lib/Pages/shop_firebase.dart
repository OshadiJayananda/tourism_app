import 'package:firebase_database/firebase_database.dart';
import 'package:tourism_app/models/shop.dart';

class ShopService {
  ShopService._privateConstructor();
  static final ShopService _instance = ShopService._privateConstructor();

  // Factory constructor
  factory ShopService() {
    return _instance;
  }

  Future<void> addShopsToFirebase() async {
    DatabaseReference databaseRef =
        FirebaseDatabase.instance.ref().child('shops');

    // Sample list of shops
    List<Shop> shops = [
      Shop(
        items: [
          Item(
            'Organic Cotton T-Shirt',
            'Tee for Tree',
            '\$20',
            'assets/images/camping-organic-cotton-t-shirt.jpg',
            true,
          ),
        ],
        location: CustomLatLng(37.7749, -122.4194),
      ),
      Shop(
        items: [
          Item(
            'Eco-Friendly Bamboo Socks',
            'Comfort in Every Step',
            '\$10',
            'assets/images/bamboo-cutlery-set.jpg',
            true,
          ),
        ],
        location: CustomLatLng(34.0522, -118.2437),
      ),
      Shop(
        items: [
          Item(
            'Reusable Water Bottle',
            'Hydrate Sustainably',
            '\$15',
            'assets/images/reusable-water-bottle.jpg',
            false,
          ),
        ],
        location: CustomLatLng(40.7128, -74.0060),
      ),
    ];

    try {
      for (var shop in shops) {
        print('Adding shop...');
        await databaseRef.push().set(shop.toMap());
        print('Shop added!');
      }
      print("All shops added to Firebase!");
    } catch (e) {
      print("Error adding shops to Firebase: $e");
    }
  }

  Future<List<Map<String, dynamic>>> getFavoriteItems() async {
    DatabaseReference shopRef = FirebaseDatabase.instance.ref().child('shops');
    DataSnapshot snapshot = await shopRef.get();

    final List<Map<String, dynamic>> favoriteItems = [];
    if (snapshot.exists) {
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

    // Print return the favorite items
    print(favoriteItems);
    return favoriteItems;
  }

  Future<List<Map<String, dynamic>>?> getShops() async {
    DatabaseReference shopRef = FirebaseDatabase.instance.ref().child('shops');
    DataSnapshot snapshot = await shopRef.get();

    final List<Map<String, dynamic>> shops = [];
    if (snapshot.exists) {
      Map<dynamic, dynamic> shopsData = snapshot.value as Map<dynamic, dynamic>;
      shopsData.forEach((key, value) {
        shops.add({
          'location': value['location'],
          'items': value['items'],
        });
      });
    }

    return shops;
  }

  Future<Map<String, dynamic>> getShopDetails(String shopId) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref().child('shops/$shopId');
    DataSnapshot snapshot = await ref.get();

    if (snapshot.exists) {
      return snapshot.value as Map<String, dynamic>;
    } else {
      throw Exception('Shop not found');
    }
  }

  Future<void> updateFavoriteItem(String shopId, String itemId) async {
    DatabaseReference ref = FirebaseDatabase.instance
        .ref()
        .child('shops/$shopId/items/$itemId/isFavorite');

    DataSnapshot snapshot = await ref.get();
    if (snapshot.exists) {
      bool isFavorite = snapshot.value as bool;
      await ref.set(!isFavorite);
    }
  }

  Future<void> updateShopLocation(String shopId, CustomLatLng location) async {
    DatabaseReference ref = FirebaseDatabase.instance
        .ref()
        .child('shops/$shopId/location');

    await ref.set({
      'latitude': location.latitude,
      'longitude': location.longitude,
    });
  }

  Future<void> updateShopItem(String shopId, String itemId, Item item) async {
    DatabaseReference ref = FirebaseDatabase.instance
        .ref()
        .child('shops/$shopId/items/$itemId');

    await ref.set(item.toMap());
  }

  Future<void> deleteShopItem(String shopId, String itemId) async {
    DatabaseReference ref = FirebaseDatabase.instance
        .ref()
        .child('shops/$shopId/items/$itemId');

    await ref.remove();
  }

  Future<void> deleteShop(String shopId) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref().child('shops/$shopId');

    await ref.remove();
  }

  Future<void> addShop(Shop shop) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref().child('shops');

    await ref.push().set(shop.toMap());
  }

  Future<void> addShopItem(String shopId, Item item) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref().child('shops/$shopId/items');

    await ref.push().set(item.toMap());
  }

  Future<void> updateItemPrice(String shopId, String itemId, String price) async {
    DatabaseReference ref = FirebaseDatabase.instance
        .ref()
        .child('shops/$shopId/items/$itemId/price');

    await ref.set(price);
  }
}
