import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Message Screen'),
      ),
      body: Center(
        child: Text(
          'Welcome to the Message Screen!',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}