import 'package:flutter/material.dart';

class FileTransferButtons extends StatelessWidget {
  const FileTransferButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            icon: Icon(Icons.insert_drive_file, color: Colors.blue, size: 40),
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
    );
  }
}
