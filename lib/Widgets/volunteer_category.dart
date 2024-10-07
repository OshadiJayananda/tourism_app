import 'package:flutter/material.dart';

class VolunteerCategory extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap; // Declare the onTap parameter

  const VolunteerCategory({
    super.key,
    required this.icon,
    required this.label,
    this.onTap, // Add this line to accept onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Use the onTap parameter
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: Colors.white),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
