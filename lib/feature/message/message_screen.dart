import 'package:flutter/material.dart';
import 'chat_screen.dart';

class MessageScreen extends StatelessWidget {
  final List<Map<String, String>> contacts = [
    {"name": "Dr. Selkon Kane", "type": "Cardiologist"},
    {"name": "Dr. Watson Mushef", "type": "Neurologist"},
    {"name": "Green Life Hospital", "type": "Multi-Specialty"},
    {"name": "City Care Hospital", "type": "General Hospital"},
  ];

   MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Messages"),
          backgroundColor: Colors.blue),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];

          return ListTile(
            leading: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Icon(Icons.person, color: Colors.white)),
            title: Text(contact["name"]!,
                style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(contact["type"]!),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ChatScreen(contactName: contact["name"]!),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
