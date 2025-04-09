import 'package:flutter/material.dart';

class CallButtons extends StatelessWidget {
  const CallButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(Icons.call, color: Colors.green, size: 40),
          onPressed: () => ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Voice Call Started"))),
        ),
        SizedBox(width: 20),
        IconButton(
          icon: Icon(Icons.videocam, color: Colors.blue, size: 40),
          onPressed: () => ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Video Call Started"))),
        ),
      ],
    );
  }
}
