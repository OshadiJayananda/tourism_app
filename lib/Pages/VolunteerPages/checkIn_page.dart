import 'package:flutter/material.dart';

class CheckinPage extends StatefulWidget {
  const CheckinPage({super.key});

  @override
  State<CheckinPage> createState() => _CheckinPageState();
}

class _CheckinPageState extends State<CheckinPage> {
  bool isCheckedIn = false; // Tracks check-in status

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Check In'),
        backgroundColor: Colors.teal,
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Check-In Title
            const Text(
              'Welcome to Your Project Site!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),

            // Check-In Status
            Text(
              isCheckedIn
                  ? 'You are checked in!'
                  : 'Please check in to confirm your arrival.',
              style: TextStyle(
                fontSize: 18,
                color: isCheckedIn ? Colors.green : Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),

            // Check-In Button
            ElevatedButton.icon(
              icon: Icon(isCheckedIn ? Icons.check_circle : Icons.check),
              label: Text(
                isCheckedIn ? 'Checked In' : 'Check In Now',
                style: const TextStyle(fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: isCheckedIn ? Colors.green : Colors.teal,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              onPressed: isCheckedIn
                  ? null // Disable button once checked in
                  : () {
                      setState(() {
                        isCheckedIn = true; // Mark as checked in
                      });
                    },
            ),

            const SizedBox(height: 40),

            // Additional Information
            if (isCheckedIn)
              Column(
                children: const [
                  Text(
                    'You have successfully checked in. Thank you for your punctuality!',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Feel free to explore the area or begin your tasks.',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
