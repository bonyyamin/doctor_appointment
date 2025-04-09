import 'package:flutter/material.dart';

class CallScreen extends StatelessWidget {
  final String contactName;
  final bool isVideo;

  const CallScreen({super.key, required this.contactName, this.isVideo = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(isVideo ? "Video Call" : "Voice Call"),
          backgroundColor: Colors.green),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(isVideo ? Icons.videocam : Icons.call,
                size: 100, color: Colors.green),
            SizedBox(height: 20),
            Text("Calling $contactName...", style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: Text("End Call"),
            ),
          ],
        ),
      ),
    );
  }
}
