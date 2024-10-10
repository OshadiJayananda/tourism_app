import 'package:flutter/material.dart';

class ReviewConfirmation extends StatefulWidget {
  const ReviewConfirmation({super.key});

  @override
  State<ReviewConfirmation> createState() => _ReviewConfirmationState();
}

class _ReviewConfirmationState extends State<ReviewConfirmation> {
  bool isConfirmed = false; // State to track participation confirmation

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Review Confirmation Details'),
        backgroundColor: Colors.teal,
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Section Title
            const Text(
              'Trip Information',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            // Display trip details
            _buildTripDetail('Dates:', 'Oct 12, 2024 - Oct 20, 2024'),
            _buildTripDetail('Accommodation:', 'Greenfield Eco-Lodge'),
            _buildTripDetail('Transport:', 'Shuttle from Airport'),
            _buildTripDetail('Personal Info:', 'John Doe - Passport: X12345678'),
            _buildTripDetail('Contact:', 'johndoe@example.com'),

            const SizedBox(height: 24),

            // Checklist for documents/payments
            const Text(
              'Checklist',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            _buildChecklistItem('Passport (Valid for 6 months)'),
            _buildChecklistItem('Travel Insurance'),
            _buildChecklistItem('Vaccination Certificate'),
            _buildChecklistItem('Flight Tickets'),
            _buildChecklistItem('Final Payment (Due: Oct 5, 2024)'),

            const SizedBox(height: 24),

            // Confirmation Button
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isConfirmed = true; // Set state to confirmed
                });
                // Additional action, like saving to a database
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: isConfirmed ? Colors.grey : Colors.teal,
                padding: const EdgeInsets.symmetric(vertical: 16.0),
              ),
              child: Text(
                isConfirmed ? 'Participation Confirmed' : 'Confirm Participation',
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to display trip details
  Widget _buildTripDetail(String title, String detail) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              detail,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to display checklist items
  Widget _buildChecklistItem(String item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          const Icon(Icons.check_box_outline_blank, color: Colors.teal),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              item,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
