import 'package:flutter/material.dart';

class Loginhours extends StatefulWidget {
  const Loginhours({super.key});

  @override
  State<Loginhours> createState() => _LoginhoursState();
}

class _LoginhoursState extends State<Loginhours> {
  final TextEditingController _hoursController = TextEditingController();
  List<String> loggedHours = [];

  void _logHours() {
    setState(() {
      loggedHours.add(_hoursController.text);
      _hoursController.clear();
    });
  }

  @override
  void dispose() {
    _hoursController.dispose(); // Clean up the controller when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log Volunteer Hours'),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Track your hours worked on this project:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            // Input field for logging hours
            TextField(
              controller: _hoursController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter hours worked',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Log Hours button
            ElevatedButton.icon(
              icon: const Icon(Icons.access_time),
              label: const Text('Log Hours'),
              onPressed: () {
                if (_hoursController.text.isNotEmpty) {
                  _logHours();
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              ),
            ),

            const SizedBox(height: 30),

            // Display logged hours
            const Text(
              'Logged Hours:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: loggedHours.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.timer),
                    title: Text('${loggedHours[index]} hours'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
