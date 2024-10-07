class Shop {
  List<Item> items;
  CustomLatLng location;

  Shop({
    required this.items,
    required this.location,
  });

  // Create a factory method to convert Firebase data into a Shop object
  factory Shop.fromMap(Map<String, dynamic> map) {
    var itemList =
        (map['items'] as List).map((itemMap) => Item.fromMap(itemMap)).toList();

    return Shop(
      items: itemList,
      location: CustomLatLng(
        map['location']['latitude'],
        map['location']['longitude'],
      ),
    );
  }

  // Convert the Shop object to a Map for Firebase
  Map<String, dynamic> toMap() {
    return {
      'items': items.map((item) => item.toMap()).toList(),
      'location': {
        'latitude': location.latitude,
        'longitude': location.longitude,
      },
    };
  }
}

class CustomLatLng {
  double latitude;
  double longitude;

  CustomLatLng(this.latitude, this.longitude);
}

class Item {
  bool isFavorite = false;
  String label;
  String subLabel;
  String price;
  String imgUrl;

  Item(this.label, this.subLabel, this.price, this.imgUrl, this.isFavorite);

  // Factory method to create an Item from a map
  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      map['label'],
      map['subLabel'],
      map['price'],
      map['imgUrl'],
      map['isFavorite'],
    );
  }

  // Convert the Item object to a Map for Firebase
  Map<String, dynamic> toMap() {
    return {
      'label': label,
      'subLabel': subLabel,
      'price': price,
      'imgUrl': imgUrl,
      'isFavorite': isFavorite,
    };
  }
}
