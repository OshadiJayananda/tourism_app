import 'dart:io';
import 'dart:typed_data'; // Import this for Uint8List

import 'package:file_picker/file_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart'; // Import for kIsWeb
import 'package:flutter/material.dart';

class VolunteerApplicationPage extends StatefulWidget {
  const VolunteerApplicationPage({super.key});

  @override
  State<VolunteerApplicationPage> createState() =>
      _VolunteerApplicationPageState();
}

class _VolunteerApplicationPageState extends State<VolunteerApplicationPage> {
  final database = FirebaseDatabase.instance.ref();
  PlatformFile? pickedFile;
  UploadTask? uploadTask;

  final _formKey = GlobalKey<FormState>();
  String name = '';
  String age = '';
  DateTime? birthday;
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

  void selectFile() async {
    final result = await FilePicker.platform.pickFiles();

    if (result == null) {
      return;
    }
    setState(() {
      pickedFile = result.files.first;
    });
  }

  Future<void> uploadFile() async {
    if (pickedFile == null) return;

    String path = 'files/${pickedFile!.name}'; // Path in Firebase Storage
    Uint8List? fileBytes; // For web platform
    File? file; // For mobile/desktop platforms

    // Check if we're on the web
    if (kIsWeb) {
      // Access file bytes instead of path for web
      fileBytes = pickedFile!.bytes;
    } else {
      // Access path for mobile and desktop
      file = File(pickedFile!.path!);
    }

    // Create a reference to Firebase Storage
    final storageRef = FirebaseStorage.instance.ref().child(path);

    if (kIsWeb) {
      // Upload file bytes for web
      setState(() {
        uploadTask = storageRef.putData(fileBytes!);
      });
    } else {
      // Upload file for mobile and desktop
      setState(() {
        uploadTask = storageRef.putFile(file!);
      });
    }

    // Handle file upload completion
    final snapshot = await uploadTask!.whenComplete(() {});

    // Get the download URL of the uploaded file
    final urlDownload = await snapshot.ref.getDownloadURL();
    print('Download Link: $urlDownload');

    setState(() {
      uploadTask = null;
    });
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
                pickedFile != null
                    ? CircleAvatar(
                        radius: 64,
                        backgroundColor: Colors.blue[100],
                        backgroundImage: kIsWeb
                            ? MemoryImage(pickedFile!.bytes!)
                            : FileImage(File(pickedFile!.path!)),
                      )
                    : const CircleAvatar(
                        radius: 64,
                        backgroundColor: Colors.blue,
                        backgroundImage:
                            AssetImage('assets/images/avatarImg.jpg'),
                      ),
      
                Positioned(
                  bottom: -10,
                  left: 80,
                  child: IconButton(
                    onPressed: selectFile,
                    icon: const Icon(Icons.add_a_photo),
                  ),
                ),

                const SizedBox(height: 32),
                ElevatedButton(
                  child: const Text('Upload File'),
                  onPressed: uploadFile,
                ),
                const SizedBox(height: 32),
                const Text('Name',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextFormField(
                  decoration:
                      const InputDecoration(hintText: 'Enter your name'),
                  onChanged: (value) => setState(() => name = value),
                ),
                const SizedBox(height: 16),
                const Text('Age',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Enter your age'),
                  keyboardType: TextInputType.number,
                  onChanged: (value) => setState(() => age = value),
                ),
                const SizedBox(height: 16),
                const Text('Birthday',
                    style: TextStyle(fontWeight: FontWeight.bold)),
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
                    // In the submit button's onPressed method:
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

                          // Clear the image selection
                          setState(() {
                            pickedFile = null; // Clear the picked file
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
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text('Submit Application'),
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
