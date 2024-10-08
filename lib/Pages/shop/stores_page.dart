import 'package:flutter/material.dart';
import '../../Widgets/shop_widgets/CategoryCard.dart';
import '../../Widgets/shop_widgets/EcoFriendlyTip.dart';
import '../../Widgets/shop_widgets/FeaturedItemCard.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class StoresPage extends StatefulWidget {
  const StoresPage({super.key});

  @override
  State<StoresPage> createState() => _StoresPageState();
}

class _StoresPageState extends State<StoresPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Eco Shop', style: TextStyle(color: Colors.white)),
        elevation: 0,
        centerTitle: true,
        // leading: Icon(Icons.arrow_back, color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              print("button pressed");
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Search bar
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Search for eco-friendly items',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text('Find what you need',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                ],
              ),
            ),

            // Categories section
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CategoryCard(
                      icon: Icons.eco,
                      label: 'Organic Shops',
                      color: Colors.green),
                  CategoryCard(
                      icon: Icons.public,
                      label: 'Sustainable Brands',
                      color: Colors.blue),
                  CategoryCard(
                      icon: Icons.local_florist,
                      label: 'Eco-Friendly Products',
                      color: Colors.green),
                ],
              ),
            ),

            // Featured items section
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Featured Items',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  SingleChildScrollView(
                    scrollDirection:
                        Axis.horizontal, // Enable horizontal scrolling
                    child: Row(
                      children: [
                        FeaturedItemCard(
                          label: 'Organic Cotton T-Shirt',
                          price: '\$20',
                          subLabel: 'Tee for Tree',
                          imgUrl:
                              'assets/images/camping-organic-cotton-t-shirt.jpg',
                          location:
                              LatLng(37.7749, -122.4194), // Example coordinates
                        ),
                        const SizedBox(width: 16), // Space between the cards
                        FeaturedItemCard(
                          label: 'Reusable Bamboo Cutlery Set',
                          price: '\$15',
                          subLabel: 'Eco-Eat Utensils',
                          imgUrl: 'assets/images/bamboo-cutlery-set.jpg',
                          location:
                              LatLng(37.7749, -122.4194), // Example coordinates
                        ),
                        const SizedBox(width: 16), // Space between the cards
                        FeaturedItemCard(
                          label: 'Eco-Friendly Water Bottle',
                          price: '\$12',
                          subLabel: 'Hydrate Sustainably',
                          imgUrl: 'assets/images/reusable-water-bottle.jpg',
                          location:
                              LatLng(37.7749, -122.4194), // Example coordinates
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Eco-friendly tips section
            Container(
              padding: const EdgeInsets.all(16),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Eco-Friendly Tips',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  EcoFriendlyTip(
                    icon: Icons.recycling,
                    title: 'Reduce, Reuse, Recycle',
                    description:
                        'Learn how to minimize waste and protect the planet.',
                    details:
                        'Recycling helps reduce the amount of waste sent to landfills and conserves natural resources. Make sure to follow your local recycling guidelines to ensure that materials are processed correctly.',
                  ),
                  EcoFriendlyTip(
                    icon: Icons.nature,
                    title: 'Compost Organic Waste',
                    description:
                        'Transform food scraps and yard waste into nutrient-rich compost to enrich your garden and reduce landfill waste.',
                    details:
                        'Composting not only reduces waste but also creates a natural fertilizer for your plants. It’s a great way to contribute to a healthy ecosystem!',
                  ),
                  EcoFriendlyTip(
                    icon: Icons.shopping_bag,
                    title: 'Use Reusable Bags',
                    description:
                        'Opt for reusable shopping bags to cut down on plastic waste and help keep our oceans clean.',
                    details:
                        'Reusable bags can be used for years, significantly reducing the demand for single-use plastic bags. Plus, they come in many fun designs!',
                  ),
                  EcoFriendlyTip(
                    icon: Icons.power,
                    title: 'Choose Energy-Efficient Appliances',
                    description:
                        'When purchasing new appliances, select energy-efficient models to save energy and reduce your utility bills.',
                    details:
                        'Energy-efficient appliances use less electricity, which not only saves you money but also helps reduce greenhouse gas emissions.',
                  ),
                  EcoFriendlyTip(
                    icon: Icons.local_drink,
                    title: 'Drink Tap Water',
                    description:
                        'Use a reusable water bottle and drink tap water instead of buying bottled water to reduce plastic pollution.',
                    details:
                        'Drinking tap water can save you money and is often just as safe and clean as bottled water. Use a reusable bottle to cut down on waste!',
                  ),
                  EcoFriendlyTip(
                    icon: Icons.nature_people,
                    title: 'Plant Trees',
                    description:
                        'Trees absorb carbon dioxide, improve air quality, and provide habitat for wildlife. Planting trees is a great way to help the environment.',
                    details:
                        'Each tree can absorb approximately 48 pounds of carbon dioxide per year. Consider planting a tree in your yard or participating in community tree-planting events!',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      /*
      // Bottom navigation bar
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.store), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: ''),
        ],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
      ),

      */
    );
  }
}
