import 'package:flutter/material.dart';

class EcoFriendlyTip extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final String details; // Additional details to show in the modal

  const EcoFriendlyTip({
    required this.icon,
    required this.title,
    required this.description,
    required this.details, // New parameter for modal details
  });

  // Function to show modal with details
  void _showDetails(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 5,
          child: Container(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              // Enable scrolling if content overflows
              child: Column(
                mainAxisSize: MainAxisSize
                    .min, // Adjusts the dialog size based on content
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        // Prevents overflow by allowing flexible space
                        child: Text(
                          title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Icon(icon, color: Colors.green, size: 40),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    details,
                    style: const TextStyle(color: Colors.black54, fontSize: 14),
                    // Add overflow handling if necessary
                    overflow: TextOverflow.visible, // or TextOverflow.ellipsis
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the modal
                    },
                    child: const Text('Close'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showDetails(context), // Show modal on tap
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.green, size: 40),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: const TextStyle(color: Colors.grey),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
