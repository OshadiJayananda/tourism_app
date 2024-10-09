import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class MessagePage extends StatefulWidget {
  final String shopName; // Shop name to display in the AppBar
  final List<String>
      previousMessages; // List of previous messages (can be modified as per your data model)

  MessagePage({
    Key? key,
    required this.shopName,
    required this.previousMessages,
  }) : super(key: key);

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  final TextEditingController _messageController = TextEditingController();
  List<String> _messages = [];
  late DatabaseReference volunteerRef;

  @override
  void initState() {
    super.initState();
    // Initialize messages with previous messages
    _messages = widget.previousMessages;
    final database = FirebaseDatabase.instance.ref();
    volunteerRef = database.child('messages');
  }

  void _sendMessage() {
    final String newMessage = _messageController.text.trim();
    if (newMessage.isNotEmpty) {
      setState(() {
        _messages.add(newMessage); // Add the new message to the message list
      });
      _messageController.clear(); // Clear the input field after sending
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.shopName), // Display the shop name
      ),
      body: Column(
        children: [
          // Display previous messages in a scrollable ListView
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16.0),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return Align(
                  alignment:
                      Alignment.centerLeft, // Align all messages to the left
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    padding: EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Colors.blue[100],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      _messages[index],
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                );
              },
            ),
          ),
          // Message input and send button at the bottom
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                // Input field for typing the message
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Type your message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                // Send button
                ElevatedButton(
                  onPressed: _sendMessage,
                  child: Icon(Icons.send),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(14.0),
                    shape: CircleBorder(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
