import 'package:flutter/material.dart';

class VolunteerCategory extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap; // Add this line to define onTap

  const VolunteerCategory({
    Key? key,
    required this.icon,
    required this.label,
    this.onTap, // Add onTap to the constructor parameters
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Use onTap here
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
            child: Icon(
              icon,
              size: 30,
              color: Colors.teal,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
