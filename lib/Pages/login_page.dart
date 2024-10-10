import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourism_app/Pages/main_page.dart';
import 'addlocations_page.dart';  // Import the add location page here
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Reference to Firebase Realtime Database
  final DatabaseReference _databaseReference =
  FirebaseDatabase.instance.ref().child('users');

  // Function to authenticate user login
  void _loginUser() async {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (username.isNotEmpty && password.isNotEmpty) {
      _databaseReference
          .orderByChild('username')
          .equalTo(username)
          .once()
          .then((DatabaseEvent event) {
        if (event.snapshot.exists) {
          Map<dynamic, dynamic> userData =
          event.snapshot.value as Map<dynamic, dynamic>;

          // Verify password
          userData.forEach((key, value) async {
            if (value['password'] == password) {
              // Save user ID to session storage using SharedPreferences
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.setString('loggedUserId', key); // Store the user ID

              // Check if username is 'Admin'
              if (username == 'Admin') {
                // Navigate to the AddLocationsPage
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => AddLocationsPage()),
                );
              } else {
                // Navigate to the MainPage for regular users
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MainPage()),
                );
              }

              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Login successful')));
            } else {
              // Incorrect password
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Incorrect password')));
            }
          });
        } else {
          // Username not found
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Username not found')));
        }
      }).catchError((error) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Error logging in')));
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please fill all fields')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _loginUser,
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
