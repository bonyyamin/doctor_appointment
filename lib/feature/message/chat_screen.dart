import 'package:doctor_appointment/feature/message/widgets/chat_bubble.dart';
import 'package:flutter/material.dart';
import 'call_screen.dart';
import 'file_transfer_screen.dart';

class ChatScreen extends StatefulWidget {
  final String contactName;
  const ChatScreen({super.key, required this.contactName});

  @override
  ChatScreenState createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, String>> _messages = [
    {"sender": "Doctor", "message": "Hello! How can I assist you today?"},
  ];

  void _sendMessage() {
    if (_messageController.text.trim().isNotEmpty) {
      setState(() {
        _messages
            .add({"sender": "User", "message": _messageController.text.trim()});
        _messageController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.contactName),
        actions: [
          IconButton(
            icon: Icon(Icons.call),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) =>
                          CallScreen(contactName: widget.contactName)));
            },
          ),
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => CallScreen(
                          contactName: widget.contactName, isVideo: true)));
            },
          ),
          IconButton(
            icon: Icon(Icons.attach_file),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) =>
                          FileTransferScreen(contactName: widget.contactName)));
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16.0),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                bool isUser = message["sender"] == "User";

                return ChatBubble(message: message["message"]!, isUser: isUser);
              },
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Colors.grey.shade300))),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              decoration: InputDecoration(
                  hintText: "Type your message...", border: InputBorder.none),
            ),
          ),
          IconButton(
              icon: Icon(Icons.send, color: Colors.blue),
              onPressed: _sendMessage),
        ],
      ),
    );
  }
}
