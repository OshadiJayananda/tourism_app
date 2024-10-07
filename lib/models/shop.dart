class Shop {
  String label;
  String subLabel;
  String price;
  String imgUrl;
  CustomLatLng location; // Use the new name here

  Shop({
    required this.label,
    required this.subLabel,
    required this.price,
    required this.imgUrl,
    required this.location,
  });

  // Create a factory method to convert Firebase data into a Shop object
  factory Shop.fromMap(Map<String, dynamic> map) {
    return Shop(
      label: map['label'],
      subLabel: map['subLabel'],
      price: map['price'],
      imgUrl: map['imgUrl'],
      location: CustomLatLng(
        map['location']['latitude'],
        map['location']['longitude'],
      ),
    );
  }

  // Convert the Shop object to a Map for Firebase
  Map<String, dynamic> toMap() {
    return {
      'label': label,
      'subLabel': subLabel,
      'price': price,
      'imgUrl': imgUrl,
      'location': {
        'latitude': location.latitude,
        'longitude': location.longitude,
      },
    };
  }
}

class CustomLatLng { // Renamed here
  double latitude;
  double longitude;

  CustomLatLng(this.latitude, this.longitude);
}
