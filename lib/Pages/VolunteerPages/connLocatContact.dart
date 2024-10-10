import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Connlocatcontact extends StatefulWidget {
  const Connlocatcontact({super.key});

  @override
  State<Connlocatcontact> createState() => _ConnlocatcontactState();
}

class _ConnlocatcontactState extends State<Connlocatcontact> {
  // Sample list of local contacts
  final List<Map<String, String>> localContacts = [
    {
      'name': 'John Doe',
      'role': 'Project Coordinator',
      'phone': '+123456789',
    },
    {
      'name': 'Jane Smith',
      'role': 'Local Guide',
      'phone': '+987654321',
    },
    {
      'name': 'Carlos Fernandez',
      'role': 'Community Leader',
      'phone': '+192837465',
    },
  ];

  // Function to make a phone call
  void _makePhoneCall(String phoneNumber) async {
    final Uri callUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunch(callUri.toString())) {
      await launch(callUri.toString());
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }

  // Function to send an SMS
  void _sendSMS(String phoneNumber) async {
    final Uri smsUri = Uri(scheme: 'sms', path: phoneNumber);
    if (await canLaunch(smsUri.toString())) {
      await launch(smsUri.toString());
    } else {
      throw 'Could not send SMS to $phoneNumber';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Local Contacts'),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: localContacts.length,
          itemBuilder: (context, index) {
            final contact = localContacts[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                leading: const Icon(Icons.person, color: Colors.teal),
                title: Text(contact['name']!),
                subtitle: Text(contact['role']!),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.phone, color: Colors.teal),
                      onPressed: () => _makePhoneCall(contact['phone']!),
                    ),
                    IconButton(
                      icon: const Icon(Icons.message, color: Colors.teal),
                      onPressed: () => _sendSMS(contact['phone']!),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
