import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourism_app/Pages/main_page.dart';
import 'package:tourism_app/Pages/signup_page.dart';
import 'addlocations_page.dart'; // Import the add location page here
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
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Error logging in')));
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
        backgroundColor: Colors.teal[700],
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal[100]!, Colors.teal[400]!],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // App logo or title
                Icon(
                  Icons.lock_outline,
                  size: 100,
                  color: Colors.white,
                ),
                const SizedBox(height: 30),
                // Username TextField
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                  ),
                ),
                const SizedBox(height: 20),
                // Password TextField
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                  ),
                ),
                const SizedBox(height: 30),
                // Login button
                ElevatedButton(
                  onPressed: _loginUser,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal[700],
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(height: 20),
                // Signup link or alternative actions
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignupPage()),
                    );
                  },
                  child: const Text(
                    'Don\'t have an account? Sign Up',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
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
