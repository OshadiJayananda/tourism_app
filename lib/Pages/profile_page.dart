import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _username = '';
  String _email = '';
  String _homeLocation = '';

  final DatabaseReference _databaseReference =
      FirebaseDatabase.instance.ref().child('users');

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  // Function to load the user data from Firebase based on logged-in user's ID
  Future<void> _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('loggedUserId');

    if (userId != null) {
      DatabaseEvent event = await _databaseReference.child(userId).once();
      if (event.snapshot.exists) {
        Map<String, dynamic> userData =
            event.snapshot.value as Map<String, dynamic>;
        setState(() {
          // _username = userData['username'] ?? '';
          // _email = userData['email'] ?? '';
          // _homeLocation = userData['home_location'] ?? '';
          _username = 'Denuwan Perera';
          _email = 'denuwan@gmail.com';
          _homeLocation = 'Malabe';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.teal, // AppBar color
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'User Details',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.teal, // Section title color
              ),
            ),
            const SizedBox(height: 30),
            _buildProfileDetail('Name', _username),
            const SizedBox(height: 20),
            _buildProfileDetail('Email', _email),
            const SizedBox(height: 20),
            _buildProfileDetail('Location', _homeLocation),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileDetail(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label: ',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black87, // Label color
          ),
        ),
        Expanded(
          child: Text(
            value.isNotEmpty ? value : 'Not available',
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black54, // Value color
            ),
          ),
        ),
      ],
    );
  }
}
