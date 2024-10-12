import 'package:flutter/material.dart';
import 'EcofriendlyOptionsScreen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CarbonResults extends StatelessWidget {
  final double emissions; // Dynamic carbon emission value
  final String pickupLocation;
  final String dropOffLocation;
  final String travelMode;
  final Map<String, double> allEmissions; 

  const CarbonResults({super.key, 
    required this.emissions,
    required this.pickupLocation,
    required this.dropOffLocation,
    required this.travelMode,
     required this.allEmissions, 
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF009688),
        title: const Text('Carbon Emission Results', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title Section
            _buildTitleSection(),

            // Carbon Emission Display
            _buildEmissionDisplay(),

            // Suggested Travel Mode as Text
            _buildSuggestedTravelModes(),

            // Best Travel Modes Section
            _buildBestTravelModesSection(),

            // Alternative Suggestions
            _buildAlternativeSuggestions(context),

            // Explore More Options Button
            _buildExploreMoreButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTitleSection() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Text(
        'Carbon Footprint Result',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF009688)),
      ),
    );
  }

  Widget _buildEmissionDisplay() {
    return GestureDetector(
      onTap: () {
        // Add functionality for interaction, like showing more details or charts
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 176, 205, 202),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Carbon Emission:', style: TextStyle(fontSize: 20, color: Colors.white)),
            Text('${emissions.toStringAsFixed(2)} kg CO2',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 13, 62, 58))),
          ],
        ),
      ),
    );
  }

// Method to suggest the two best travel modes based on emissions
  List<String> suggestBestTravelModes() {
    // Example travel modes with associated emissions
    Map<String, double> travelModes = {
      'Car': allEmissions['Car'] ?? double.infinity,
      'Bus': allEmissions['Bus'] ?? double.infinity,
      'Train': allEmissions['Train'] ?? double.infinity,
      'Bicycle': allEmissions['Bicycle'] ?? double.infinity,
    };

    // Sort travel modes by emissions
    var sortedModes = travelModes.entries.toList()
      ..sort((a, b) => a.value.compareTo(b.value));

    // Get the two best modes
    return sortedModes.take(2).map((entry) => entry.key).toList();
  }

  Widget _buildSuggestedTravelModes() {
    List<String> bestTravelModes = suggestBestTravelModes(); // Get the best travel modes

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            const Text('Suggested Travel Modes:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Column(
              children: bestTravelModes.map((mode) {
                return Text(
                  mode,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF009688)),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }


   Widget _buildBestTravelModesSection() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Best Travel Modes', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildTravelModeCard(Icons.directions_car, 'Car', '${allEmissions['Car']?.toStringAsFixed(2)} kg CO2', Colors.redAccent),
              _buildTravelModeCard(Icons.directions_bus, 'Bus', '${allEmissions['Bus']?.toStringAsFixed(2)} kg CO2', Colors.blueAccent),
              _buildTravelModeCard(Icons.directions_bike, 'Bicycle', '${allEmissions['Bicycle']?.toStringAsFixed(2)} kg CO2', Colors.greenAccent),
              _buildTravelModeCard(Icons.train, 'Train', '${allEmissions['Train']?.toStringAsFixed(2)} kg CO2', Colors.orangeAccent),
            ],
          ),
        ],
      ),
    );
  }


Widget _buildAlternativeSuggestions(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(top: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Alternative Suggestions', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        _buildAlternativeSuggestionCard(
          'Use Public Transport',
          Icons.train,
          context,
          const PublicTransportPage(),
          'Recommended - Low Carbon Emissions'
        ),
        const SizedBox(height: 8),
        _buildAlternativeSuggestionCard(
          'Carpooling',
          Icons.car_rental,
          context,
          const CarpoolingPage(),
          'Recommended - Share Rides to Reduce Emissions'
        ),
        const SizedBox(height: 8),
        _buildAlternativeSuggestionCard(
          'Walking',
          Icons.directions_walk,
          context,
          const WalkingPage(),
          'Recommended - Zero Emissions'
        ),
        const SizedBox(height: 8),
        _buildAlternativeSuggestionCard(
          'Electric Scooter',
          Icons.electric_scooter,
          context,
          const ElectricScooterPage(),
          'Recommended - Electric Power, No Fossil Fuels'
        ),
        const SizedBox(height: 8),
        _buildAlternativeSuggestionCard(
          'Car Sharing',
          Icons.group,
          context,
          const CarSharingPage(),
          'Recommended - Efficient Resource Use'
        ),
        const SizedBox(height: 8),
        _buildAlternativeSuggestionCard(
          'Hybrid Vehicles',
          Icons.electric_car,
          context,
          const HybridVehiclesPage(),
          'Recommended - Lower Emissions Than Traditional Cars'
        ),
        const SizedBox(height: 8),
        _buildAlternativeSuggestionCard(
          'Telecommuting',
          Icons.home,
          context,
          const TelecommutingPage(),
          'Recommended - No Travel, No Emissions'
        ),
      ],
    ),
  );
}





Widget _buildExploreMoreButton(BuildContext context) {
  return Center(
    child: ElevatedButton(
      onPressed: () {
        // Navigate to the EcofriendlyOptionsScreen when button is clicked
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const EcofriendlyOptionsScreen()),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF009688),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
      child: const Text('Explore More Options'),
    ),
  );
}

  // Method to build Travel Mode Card
  Widget _buildTravelModeCard(IconData icon, String mode, String emission, Color color) {
    return SizedBox(
      width: 90,
      child: Card(
        elevation: 4,
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 35, color: color),
              const SizedBox(height: 8),
              Text(mode, style: const TextStyle(fontSize: 16)),
              Text(emission, style: TextStyle(fontSize: 14, color: color)),
            ],
          ),
        ),
      ),
    );
  }

  // Method to build Alternative Suggestion Card
Widget _buildAlternativeSuggestionCard(String title, IconData icon, BuildContext context, Widget nextPage, String subtitle) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => nextPage));
    },
    child: Card(
      elevation: 4,
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFF009688)),
        title: Text(title, style: const TextStyle(fontSize: 16)),
        subtitle: Text(subtitle, style: const TextStyle(color: Colors.grey)),
      ),
    ),
  );
}

}

// Placeholder classes for navigation (replace these with your actual pages)
  // Reusable step builder function with icons
  Widget _buildStep(IconData icon, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: const Color(0xFF009688), size: 30),
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              description,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }



class PublicTransportPage extends StatelessWidget {
  const PublicTransportPage({super.key});

  @override
  Widget build(BuildContext context) {  // Ensure context is passed here
    return Scaffold(
      appBar: AppBar(
        title: const Text('Public Transport'),
        backgroundColor: const Color(0xFF009688), // Main color
      ),
      body: _buildContent(context), // Pass context here
    );
  }

Widget _buildContent(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Add a header illustration for visual appeal
          Center(
            child: SvgPicture.asset(
              'assets/images/PublicTransport.svg', // Add your custom SVG here
              height: 150,
            ),
          ),
          const SizedBox(height: 20),

          //Title section
            const Text(
              'Why Use Public Transport?',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Color(0xFF009688),
            ),
          ),
          const SizedBox(height: 10),
            const Text(
              'Using public transport reduces traffic congestion and pollution. It is cost-effective and helps you save money on fuel and parking.',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black87,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 20),
            const Text(
              'How to Add Public Transport to Your Trip:',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF009688),
            ),
          ),
          const SizedBox(height: 10),
          // Steps with Icons and Styling
          _buildStep(
            Icons.route,
            ' Plan your route using a public transport app.',
          ),
          _buildStep(
            Icons.access_time,
            ' Check the schedule and timings of the buses/trains.',
          ),
          _buildStep(
            Icons.attach_money,
            ' Purchase a ticket in advance or use contactless payment options.',
          ),
          _buildStep(
            Icons.time_to_leave,
            ' Stay updated with any service disruptions or changes.',
          ),

          const SizedBox(height: 20),

          // A more prominent Back button with improved styling
          Center(
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back, size: 20),
              label: const Text('Back'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF009688),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}



class CarpoolingPage extends StatelessWidget {
  const CarpoolingPage({super.key});

  @override
  Widget build(BuildContext context) {  // Ensure context is passed here
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carpooling'),
        backgroundColor: const Color(0xFF009688),
      ),
      body: _buildContent(context), // Pass context here
    );
  }

  Widget _buildContent(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Add a header illustration for visual appeal
          Center(
            child: SvgPicture.asset(
              'assets/images/Carpooling.svg', // Add your custom SVG here
              height: 150,
            ),
          ),
          const SizedBox(height: 20),

          // Title Section
          const Text(
            'Why Carpooling?',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Color(0xFF009688),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Carpooling reduces the number of cars on the road, saving money and lowering emissions. It also promotes social interaction.',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black87,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 20),

          // How to Add Carpooling Section
          const Text(
            'How to Add Carpooling to Your Trip:',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF009688),
            ),
          ),
          const SizedBox(height: 10),

          // Steps with Icons and Styling
          _buildStep(
            Icons.directions_car,
            ' Use a carpool app to find rides or passengers.',
          ),
          _buildStep(
            Icons.access_time,
            ' Coordinate pickup and drop-off times.',
          ),
          _buildStep(
            Icons.attach_money,
            ' Share costs for fuel and tolls with your fellow passengers.',
          ),
          _buildStep(
            Icons.verified_user,
            ' Ensure all passengers are aware of safety guidelines.',
          ),

          const SizedBox(height: 20),

          // A more prominent Back button with improved styling
          Center(
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back, size: 20),
              label: const Text('Back'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF009688),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}


class TelecommutingPage extends StatelessWidget {
  const TelecommutingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Telecommuting'),
        backgroundColor: const Color(0xFF009688),
      ),
      body: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Add a header illustration for visual appeal
          Center(
            child: SvgPicture.asset(
              'assets/images/Telecommuting.svg', // Add your custom SVG here
              height: 150,
            ),
          ),
          const SizedBox(height: 20),

          //Title section
            const Text(
                'Why Telecommute?',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Color(0xFF009688),
            ),
          ),
          const SizedBox(height: 10),
            const Text(
              'Telecommuting allows you to work from home, reducing travel time, costs, and your carbon footprint. It also promotes a better work-life balance.',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black87,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 20),
            const Text(
             'How to Get Started with Telecommuting:',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF009688),
            ),
          ),
          const SizedBox(height: 10),
          // Steps with Icons and Styling
          _buildStep(
            Icons.computer,
            ' Talk to your employer about remote work options.',
          ),
          _buildStep(
            Icons.workspace_premium,
            ' Set up a dedicated workspace at home.',
          ),
          _buildStep(
            Icons.call,
            ' Use communication tools to stay connected with your team.',
          ),
          _buildStep(
            Icons.timer,
            ' Stay organized and manage your time effectively.',
          ),

          const SizedBox(height: 20),

          // A more prominent Back button with improved styling
          Center(
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back, size: 20),
              label: const Text('Back'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF009688),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}


class WalkingPage extends StatelessWidget {
  const WalkingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Walking'),
        backgroundColor: const Color(0xFF009688),
      ),
      body: _buildContent(context),
    );
  }

    Widget _buildContent(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Add a header illustration for visual appeal
          Center(
            child: SvgPicture.asset(
              'assets/images/Walking.svg', // Add your custom SVG here
              height: 150,
            ),
          ),
          const SizedBox(height: 20),

          //Title section
            const Text(
                'Why Walk?',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Color(0xFF009688),
            ),
          ),
          const SizedBox(height: 10),
            const Text(
              'Walking is the most eco-friendly way to travel. It reduces your carbon footprint, saves money on transport, and keeps you healthy.',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black87,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 20),
            const Text(
            'How to Incorporate Walking into Your Trip:',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF009688),
            ),
          ),
          const SizedBox(height: 10),
          // Steps with Icons and Styling
          _buildStep(
            Icons.directions_walk,
            ' Plan your route to include walking paths.',
          ),
          _buildStep(
            Icons.social_distance,
            ' Use walking apps to track your distance and pace.',
          ),
          _buildStep(
            Icons.nordic_walking,
            ' Wear comfortable shoes and stay hydrated.',
          ),
          _buildStep(
            Icons.route,
            ' Consider walking for short distances instead of using a vehicle.',
          ),

          const SizedBox(height: 20),

          // A more prominent Back button with improved styling
          Center(
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back, size: 20),
              label: const Text('Back'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF009688),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}


class ElectricScooterPage extends StatelessWidget {
  const ElectricScooterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Electric Scooter'),
        backgroundColor: const Color(0xFF009688),
      ),
      body: _buildContent(context),
    );
  }

      Widget _buildContent(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Add a header illustration for visual appeal
          Center(
            child: SvgPicture.asset(
              'assets/images/ElectricScooter.svg', // Add your custom SVG here
              height: 150,
            ),
          ),
          const SizedBox(height: 20),

          //Title section
            const Text(
                'Why Use Electric Scooters?',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Color(0xFF009688),
            ),
          ),
          const SizedBox(height: 10),
            const Text(
              'Electric scooters are a fun, eco-friendly alternative for short trips. They reduce emissions and can help you avoid traffic jams.',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black87,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 20),
            const Text(
           'How to Use Electric Scooters:',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF009688),
            ),
          ),
          const SizedBox(height: 10),
          // Steps with Icons and Styling
          _buildStep(
            Icons.directions_bike,
            '  Find a nearby electric scooter rental app.',
          ),
          _buildStep(
            Icons.speed,
            ' Unlock a scooter and adjust the speed settings.',
          ),
          _buildStep(
            Icons.rule,
            ' Follow local traffic rules and regulations.',
          ),
          _buildStep(
            Icons.local_parking,
            ' Park the scooter properly when finished.',
          ),

          const SizedBox(height: 20),

          // A more prominent Back button with improved styling
          Center(
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back, size: 20),
              label: const Text('Back'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF009688),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}



class CarSharingPage extends StatelessWidget {
  const CarSharingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Car Sharing'),
        backgroundColor: const Color(0xFF009688),
      ),
      body: _buildContent(context),
    );
  }

      Widget _buildContent(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Add a header illustration for visual appeal
          Center(
            child: SvgPicture.asset(
              'assets/images/CarSharing.svg', // Add your custom SVG here
              height: 150,
            ),
          ),
          const SizedBox(height: 20),

          //Title section
            const Text(
              'Why Use Car Sharing?',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Color(0xFF009688),
            ),
          ),
          const SizedBox(height: 10),
            const Text(
              'Car sharing is an effective way to reduce the number of vehicles on the road, save money on ownership, and minimize environmental impact.',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black87,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 20),
            const Text(
              'How to Participate in Car Sharing:',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF009688),
            ),
          ),
          const SizedBox(height: 10),
          // Steps with Icons and Styling
          _buildStep(
            Icons.directions_car,
            '  Join a local car-sharing service.',
          ),
          _buildStep(
            Icons.access_time,
            ' Reserve a car through the app or website.',
          ),
          _buildStep(
            Icons.attach_money,
            ' Pick up the car and follow the rental instructions.',
          ),
          _buildStep(
            Icons.car_rental,
            ' Return the car to the designated location after use.',
          ),

          const SizedBox(height: 20),

          // A more prominent Back button with improved styling
          Center(
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back, size: 20),
              label: const Text('Back'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF009688),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}



class HybridVehiclesPage extends StatelessWidget {
  const HybridVehiclesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hybrid Vehicles'),
        backgroundColor: const Color(0xFF009688),
      ),
      body: _buildContent(context),
    );
  }

        Widget _buildContent(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Add a header illustration for visual appeal
          Center(
            child: SvgPicture.asset(
              'assets/images/HybridVehicles.svg', // Add your custom SVG here
              height: 150,
            ),
          ),
          const SizedBox(height: 20),

          //Title section
            const Text(
              'Why Choose Hybrid Vehicles?',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Color(0xFF009688),
            ),
          ),
          const SizedBox(height: 10),
            const Text(
              'Hybrid vehicles combine a traditional gasoline engine with an electric motor, providing better fuel efficiency and lower emissions.',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black87,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 20),
            const Text(
              'How to Use Hybrid Vehicles:',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF009688),
            ),
          ),
          const SizedBox(height: 10),
          // Steps with Icons and Styling
          _buildStep(
            Icons.directions_car,
            '   Research hybrid models that fit your needs.',
          ),
          _buildStep(
            Icons.car_rental,
            ' Visit dealerships or rental services to try them out.',
          ),
          _buildStep(
            Icons.attach_money,
            ' Consider purchasing or leasing a hybrid vehicle.',
          ),
          _buildStep(
            Icons.charging_station,
            ' Learn about charging options and maintenance requirements.',
          ),

          const SizedBox(height: 20),

          // A more prominent Back button with improved styling
          Center(
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back, size: 20),
              label: const Text('Back'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF009688),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}


