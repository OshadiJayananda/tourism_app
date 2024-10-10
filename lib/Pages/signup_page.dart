import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

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
  void _signupUser() {
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

      // Storing the data in 'users' node in Firebase
      _databaseReference.push().set(userData).then((_) {
        // Display success message
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('User signed up successfully')));
        // Clear input fields
        _usernameController.clear();
        _homeLocationController.clear();
        _emailController.clear();
        _passwordController.clear();
      }).catchError((onError) {
        // Handle any errors
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Error signing up user')));
      });
    } else {
      // Display error message if fields are empty
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Please fill all fields')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
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
              controller: _homeLocationController,
              decoration: const InputDecoration(labelText: 'Home Location'),
            ),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'E-mail'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true, // To obscure the password input
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _signupUser,
              child: const Text('Sign Up'),
            ),
          ],
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
