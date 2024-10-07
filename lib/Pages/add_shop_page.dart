import 'package:firebase_database/firebase_database.dart';
import 'package:tourism_app/models/shop.dart';
// import 'package:tourism_app/models/shopPrevios.dart';

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
        FirebaseDatabase.instance.ref().child('new-shops');

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

  // Future<void> addShopsToFirebasePrevious() async {
  //   DatabaseReference databaseRef =
  //       FirebaseDatabase.instance.ref().child('shops');
  //   // Sample list of shops
  //   List<ShopPrevious> shops = [
  //     ShopPrevious(
  //       label: 'Organic Cotton T-Shirt',
  //       subLabel: 'Tee for Tree',
  //       price: '\$20',
  //       imgUrl: 'assets/images/camping-organic-cotton-t-shirt.jpg',
  //       location: CustomLatLng123(37.7749, -122.4194),
  //     ),
  //     ShopPrevious(
  //       label: 'Eco-Friendly Bamboo Socks',
  //       subLabel: 'Comfort in Every Step',
  //       price: '\$10',
  //       imgUrl: 'assets/images/bamboo-cutlery-set.jpg',
  //       location: CustomLatLng123(34.0522, -118.2437),
  //     ),
  //     ShopPrevious(
  //       label: 'Reusable Water Bottle',
  //       subLabel: 'Hydrate Sustainably',
  //       price: '\$15',
  //       imgUrl: 'assets/images/reusable-water-bottle.jpg',
  //       location: CustomLatLng123(40.7128, -74.0060),
  //     ),
  //   ];
  //   try {
  //     for (var shop in shops) {
  //       print('add one');
  //       databaseRef.push().set(shop.toMap());
  //       print('added one');
  //     }
  //     print("Shops added to Firebase!");
  //   } catch (e) {
  //     print("Error adding shops to Firebase: $e");
  //   }
  // }
}
