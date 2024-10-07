import 'package:firebase_database/firebase_database.dart';
import 'package:tourism_app/models/shop.dart';

class ShopService {
  // Private constructor
  ShopService._privateConstructor();

  // Singleton instance
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
        label: 'Organic Cotton T-Shirt',
        subLabel: 'Tee for Tree',
        price: '\$20',
        imgUrl: 'assets/images/camping-organic-cotton-t-shirt.jpg',
        location: CustomLatLng(37.7749, -122.4194),
      ),
      Shop(
        label: 'Eco-Friendly Bamboo Socks',
        subLabel: 'Comfort in Every Step',
        price: '\$10',
        imgUrl: 'assets/images/bamboo-cutlery-set.jpg',
        location: CustomLatLng(34.0522, -118.2437),
      ),
      Shop(
        label: 'Reusable Water Bottle',
        subLabel: 'Hydrate Sustainably',
        price: '\$15',
        imgUrl: 'assets/images/reusable-water-bottle.jpg',
        location: CustomLatLng(40.7128, -74.0060),
      ),
    ];

    try {
      for (var shop in shops) {
        print('add one');
        databaseRef.push().set(shop.toMap());
        print('added one');
      }
      print("Shops added to Firebase!");
    } catch (e) {
      print("Error adding shops to Firebase: $e");
    }
  }
}
