import 'package:flutter/material.dart';
import '../models/user_model.dart';

class ProfileInfoCard extends StatelessWidget {
  final UserModel user;

  const ProfileInfoCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.cake, color: Colors.blue),
            title: Text("Date of Birth"),
            subtitle: Text(user.dateOfBirth),
          ),
          ListTile(
            leading: Icon(Icons.person, color: Colors.blue),
            title: Text("Gender"),
            subtitle: Text(user.gender),
          ),
          ListTile(
            leading: Icon(Icons.location_on, color: Colors.blue),
            title: Text("Address"),
            subtitle: Text(user.address),
          ),
        ],
      ),
    );
  }
}
