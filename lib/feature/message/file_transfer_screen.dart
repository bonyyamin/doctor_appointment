import 'package:flutter/material.dart';

class FileTransferScreen extends StatelessWidget {
  final String contactName;

  const FileTransferScreen({super.key, required this.contactName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Send Files to $contactName"),
          backgroundColor: Colors.orange),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                icon:
                    Icon(Icons.insert_drive_file, color: Colors.blue, size: 40),
                onPressed: () {}),
            SizedBox(width: 20),
            IconButton(
                icon: Icon(Icons.image, color: Colors.purple, size: 40),
                onPressed: () {}),
            SizedBox(width: 20),
            IconButton(
                icon: Icon(Icons.audiotrack, color: Colors.green, size: 40),
                onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
