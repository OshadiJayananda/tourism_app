import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:path_provider/path_provider.dart';  // For accessing local directories
import 'package:path/path.dart';  // For getting the filename from the picked image

class AddLocationsPage extends StatefulWidget {
  @override
  _AddLocationsPageState createState() => _AddLocationsPageState();
}

class _AddLocationsPageState extends State<AddLocationsPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _provinceController = TextEditingController();
  final DatabaseReference _databaseRef = FirebaseDatabase.instance.ref().child('destinations');

  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  // Function to pick an image from the gallery
  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  // Function to save the selected image locally in the app's directory
  Future<String?> _saveImageLocally(BuildContext context, File image) async {
    try {
      // Get the app's documents directory
      final Directory appDir = await getApplicationDocumentsDirectory();

      // Create a directory named 'images' if it doesn't exist
      final Directory imagesDir = Directory('${appDir.path}/images');
      if (!imagesDir.existsSync()) {
        await imagesDir.create(recursive: true);
      }

      // Get the filename from the picked image and save it in the 'images' directory
      String fileName = basename(image.path);
      final File savedImage = await image.copy('${imagesDir.path}/$fileName');

      // Return the simulated 'assets/images' path to store in Firebase
      return 'assets/images/$fileName';
    } catch (e) {
      // Show snack bar using the correct BuildContext
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to save image locally: $e')),
      );
      return null;
    }
  }

  // Function to add location details to Firebase
  void _addLocation(BuildContext context) async {
    if (_formKey.currentState!.validate() && _selectedImage != null) {
      String name = _nameController.text.trim();
      String province = _provinceController.text.trim();

      // Save the image locally and get the simulated path
      String? imagePath = await _saveImageLocally(context, _selectedImage!);

      if (imagePath != null) {
        // Add data to Firebase Realtime Database
        _databaseRef.push().set({
          'image': imagePath,  // Store the simulated path to Firebase
          'name': name,
          'province': province,
        }).then((_) {
          // Show success message using correct BuildContext
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Location added successfully!')),
          );
          _nameController.clear();
          _provinceController.clear();
          setState(() {
            _selectedImage = null;
          });
        }).catchError((error) {
          // Show failure message using correct BuildContext
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to add location: $error')),
          );
        });
      }
    } else if (_selectedImage == null) {
      // Show error message when no image is selected
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select an image')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Location'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: _selectedImage != null
                      ? Image.file(_selectedImage!, fit: BoxFit.cover)
                      : Icon(Icons.camera_alt, size: 50, color: Colors.grey),
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Location Name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the location name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _provinceController,
                decoration: InputDecoration(
                  labelText: 'Province',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the province';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _addLocation(context),
                child: Text('Add Location'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
