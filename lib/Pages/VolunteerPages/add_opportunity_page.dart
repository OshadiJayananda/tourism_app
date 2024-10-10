import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class AddOpportunityPage extends StatefulWidget {
  const AddOpportunityPage({super.key});

  @override
  State<AddOpportunityPage> createState() => _AddOpportunityPageState();
}

class _AddOpportunityPageState extends State<AddOpportunityPage> {
  final _formKey = GlobalKey<FormState>();

  // Text field controllers to capture input
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _dateController = TextEditingController(); // New controller for date
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _contactNameController = TextEditingController();
  final TextEditingController _contactNumberController = TextEditingController();
  final TextEditingController _checkInTimeController = TextEditingController(); // New controller for check-in time
  final TextEditingController _durationController = TextEditingController(); // New controller for duration

  final DatabaseReference _databaseRef = FirebaseDatabase.instance.ref('opportunities'); // Firebase reference

  // Method to save opportunity to Firebase
  Future<void> _saveOpportunity() async {
    if (_formKey.currentState!.validate()) {
      await _databaseRef.push().set({
        'category': _categoryController.text,
        'name': _nameController.text,
        'location': _locationController.text,
        'date': _dateController.text, // Save date
        'description': _descriptionController.text,
        'contactName': _contactNameController.text,
        'contactNumber': _contactNumberController.text,
        'checkInTime': _checkInTimeController.text, // Add check-in time
        'duration': _durationController.text, // Add duration
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Opportunity added successfully!')),
      );

      // Clear fields after saving
      _categoryController.clear();
      _nameController.clear();
      _locationController.clear();
      _dateController.clear(); // Clear date field
      _descriptionController.clear();
      _contactNameController.clear();
      _contactNumberController.clear();
      _checkInTimeController.clear(); // Clear check-in time field
      _durationController.clear(); // Clear duration field
    }
  }

  // Method to show the date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        _dateController.text = "${picked.toLocal()}".split(' ')[0]; // Format date
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Opportunity'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: _categoryController,
                  decoration: const InputDecoration(labelText: 'Opportunity Category'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the category';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Opportunity Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _locationController,
                  decoration: const InputDecoration(labelText: 'Location'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the location';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _dateController, // Date input
                  readOnly: true,
                  decoration: const InputDecoration(
                    labelText: 'Date',
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                  onTap: () {
                    _selectDate(context); // Open date picker when tapped
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a date';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(labelText: 'Description'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a description';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _contactNameController,
                  decoration: const InputDecoration(labelText: 'Organizer\'s Contact Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the contact name';
                    }
                    return null;
                  },
                ),
                 TextFormField(
                  controller: _contactNumberController,
                  decoration: const InputDecoration(labelText: 'Organizer\'s Contact Number'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the contact Number';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _checkInTimeController, // Check-in time input
                  decoration: const InputDecoration(labelText: 'Check-in Time (e.g., 10:00 AM)'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the check-in time';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _durationController, // Duration input
                  decoration: const InputDecoration(labelText: 'Duration (e.g., 4 hours)'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the duration';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _saveOpportunity,
                  child: const Text('Add Opportunity'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
