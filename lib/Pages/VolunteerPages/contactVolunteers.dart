import 'package:flutter/material.dart';

class Contactvolunteers extends StatefulWidget {
  const Contactvolunteers({super.key});

  @override
  State<Contactvolunteers> createState() => _ContactvolunteersState();
}

class _ContactvolunteersState extends State<Contactvolunteers> {
  // Sample list of messages for chat
  final List<Map<String, String>> volunteerMessages = [
    {'name': 'Alice', 'message': 'Looking forward to the trip!'},
    {'name': 'Bob', 'message': 'Does anyone know about the accommodation?'},
    {'name': 'Catherine', 'message': 'Remember to bring reusable water bottles!'},
  ];

  // Controller to handle input from the text field
  final TextEditingController _messageController = TextEditingController();

  // Function to add a new message to the chat
  void _sendMessage() {
    if (_messageController.text.isNotEmpty) {
      setState(() {
        volunteerMessages.add({
          'name': 'You',
          'message': _messageController.text,
        });
        _messageController.clear(); // Clear input field after sending message
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Connect with Volunteers'),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: volunteerMessages.length,
              itemBuilder: (context, index) {
                final message = volunteerMessages[index];
                return ListTile(
                  leading: const Icon(Icons.person, color: Colors.teal),
                  title: Text(message['name']!),
                  subtitle: Text(message['message']!),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      labelText: 'Type your message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.teal),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}