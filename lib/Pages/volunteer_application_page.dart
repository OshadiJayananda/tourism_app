import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class VolunteerApplicationPage extends StatefulWidget {
  const VolunteerApplicationPage({super.key});

  @override
  State<VolunteerApplicationPage> createState() =>
      _VolunteerApplicationPageState();
}

class _VolunteerApplicationPageState extends State<VolunteerApplicationPage> {
  final database = FirebaseDatabase.instance.ref();

  final _formKey = GlobalKey<FormState>();
  String name = '';
  String age = ''; // New field for age
  DateTime? birthday; // New field for birthday
  String email = '';
  String phoneNumber = '';
  String country = '';
  bool hasVolunteeredBefore = false;
  String availability = 'Full-time';
  String skills = '';

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != birthday) {
      setState(() {
        birthday = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final volunteerRef = database.child('volunteers');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Volunteer Application'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Name',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextFormField(
                  decoration:
                      const InputDecoration(hintText: 'Enter your name'),
                  onChanged: (value) => setState(() => name = value),
                ),
                const SizedBox(height: 16),

                const Text('Age',
                    style: TextStyle(fontWeight: FontWeight.bold)), // Age field
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Enter your age'),
                  keyboardType: TextInputType.number,
                  onChanged: (value) => setState(() => age = value),
                ),
                const SizedBox(height: 16),

                const Text('Birthday',
                    style: TextStyle(
                        fontWeight: FontWeight.bold)), // Birthday field
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: birthday == null
                              ? 'Select your birthday'
                              : "${birthday!.day}/${birthday!.month}/${birthday!.year}",
                        ),
                        readOnly: true,
                        onTap: () => _selectDate(context),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.calendar_today),
                      onPressed: () => _selectDate(context),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                const Text('Email',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextFormField(
                  decoration:
                      const InputDecoration(hintText: 'Enter your email'),
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) => setState(() => email = value),
                ),
                const SizedBox(height: 16),

                const Text('Phone Number',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: 'Enter your phone number'),
                  keyboardType: TextInputType.phone,
                  onChanged: (value) => setState(() => phoneNumber = value),
                ),
                const SizedBox(height: 16),

                const Text('Country of Residence',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextFormField(
                  decoration:
                      const InputDecoration(hintText: 'Enter your country'),
                  onChanged: (value) => setState(() => country = value),
                ),
                const SizedBox(height: 16),

                const Text('Previous Volunteer Experience',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    Checkbox(
                      value: hasVolunteeredBefore,
                      onChanged: (bool? value) {
                        setState(() {
                          hasVolunteeredBefore = value!;
                        });
                      },
                    ),
                    const Text('Yes'),
                  ],
                ),
                const SizedBox(height: 16),

                const Text('Availability',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                DropdownButton<String>(
                  value: availability,
                  items: ['Full-time', 'Part-time', 'Weekends']
                      .map((availability) => DropdownMenuItem(
                            value: availability,
                            child: Text(availability),
                          ))
                      .toList(),
                  onChanged: (value) => setState(() => availability = value!),
                ),
                const SizedBox(height: 16),

                const Text('Skills',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: 'Enter skills relevant to volunteering'),
                  onChanged: (value) => setState(() => skills = value),
                ),
                const SizedBox(height: 24),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Construct a map of the volunteer details
                        final volunteerData = {
                          'name': name,
                          'email': email,
                          'phoneNumber': phoneNumber,
                          'country': country,
                          'age': age,
                          'birthday': birthday != null
                              ? "${birthday!.day}/${birthday!.month}/${birthday!.year}"
                              : null,
                          'hasVolunteeredBefore': hasVolunteeredBefore,
                          'availability': availability,
                          'skills': skills,
                        };

                        // Save the data to Firebase Realtime Database
                        volunteerRef.push().set(volunteerData).then((_) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text('Application Submitted Successfully')),
                          );
                          // Optionally reset the form
                          setState(() {
                            _formKey.currentState!.reset();
                            birthday = null; // Reset birthday
                            hasVolunteeredBefore = false;
                            availability = 'Full-time';
                          });
                        }).catchError((error) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text(
                                    'Failed to submit application: $error')),
                          );
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                    ),
                    child: const Text(
                      'Submit Application',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
