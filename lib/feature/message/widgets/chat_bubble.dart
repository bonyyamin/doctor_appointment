import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isUser;

  const ChatBubble({super.key, required this.message, required this.isUser});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isUser ? Colors.blue.shade100 : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(10),
        ),
        child:
            Text(message, style: TextStyle(fontSize: 16, color: Colors.black)),
      ),
    );
  }
}
