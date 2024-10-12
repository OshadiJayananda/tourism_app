import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import SharedPreferences
import 'profile_page.dart'; // Replace with your actual profile page import

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  // Controllers for text fields
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _homeLocationController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Reference to Firebase Realtime Database
  final DatabaseReference _databaseReference =
      FirebaseDatabase.instance.ref().child('users');

  // Function to handle sign-up and store data in Firebase
  void _signupUser() async {
    String username = _usernameController.text;
    String homeLocation = _homeLocationController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    if (username.isNotEmpty &&
        homeLocation.isNotEmpty &&
        email.isNotEmpty &&
        password.isNotEmpty) {
      // Creating a new user object
      Map<String, String> userData = {
        'username': username,
        'home_location': homeLocation,
        'email': email,
        'password': password,
      };

      String? userId = _databaseReference.push().key; // Create a unique user ID

      // Storing the data in 'users' node in Firebase using userId
      if (userId != null) {
        _databaseReference.child(userId).set(userData).then((_) async {
          // Store the user ID in SharedPreferences
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('userId', userId);

          // Navigate to the ProfilePage after signup
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
                builder: (context) =>
                    const ProfilePage()), // Change to your desired page
          );

          // Display success message
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('User signed up successfully')),
          );

          // Clear input fields
          _usernameController.clear();
          _homeLocationController.clear();
          _emailController.clear();
          _passwordController.clear();
        }).catchError((onError) {
          // Handle any errors
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Error signing up user')),
          );
        });
      } else {
        // Handle the case when userId is null
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error generating user ID')),
        );
      }
    } else {
      // Display error message if fields are empty
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        backgroundColor: Colors.teal[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          // Enable scrolling for smaller screens
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Create Account',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  labelStyle: const TextStyle(color: Colors.teal),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.teal[700]!),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.teal[900]!),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: _homeLocationController,
                decoration: InputDecoration(
                  labelText: 'Home Location',
                  labelStyle: const TextStyle(color: Colors.teal),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.teal[700]!),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.teal[900]!),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  labelStyle: const TextStyle(color: Colors.teal),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.teal[700]!),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.teal[900]!),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: const TextStyle(color: Colors.teal),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.teal[700]!),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.teal[900]!),
                  ),
                ),
                obscureText: true, // To obscure the password input
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _signupUser,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal[700], // Button color
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Clean up controllers when the widget is disposed
    _usernameController.dispose();
    _homeLocationController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
