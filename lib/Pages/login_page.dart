import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
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
  void _loginUser() {
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
          userData.forEach((key, value) {
            if (value['password'] == password) {
              // Correct credentials, navigate to home page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Login successful')));
            } else {
              // Incorrect password
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Incorrect password')));
            }
          });
        } else {
          // Username not found
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Username not found')));
        }
      }).catchError((error) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Error logging in')));
      });
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Please fill all fields')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _loginUser,
              child: Text('Login'),
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
