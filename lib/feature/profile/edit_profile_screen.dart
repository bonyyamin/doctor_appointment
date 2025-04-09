import 'package:flutter/material.dart';
import '../models/user_model.dart';

class EditProfileScreen extends StatefulWidget {
  final UserModel user;

  EditProfileScreen({required this.user});

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController _nameController;
  late TextEditingController _contactController;
  late TextEditingController _addressController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.user.fullName);
    _contactController = TextEditingController(text: widget.user.contact);
    _addressController = TextEditingController(text: widget.user.address);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _contactController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  void _saveChanges() {
    Navigator.pop(context); // Save logic can be implemented
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit Profile"), backgroundColor: Colors.blue),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: "Full Name")),
            TextField(
                controller: _contactController,
                decoration: InputDecoration(labelText: "Contact")),
            TextField(
                controller: _addressController,
                decoration: InputDecoration(labelText: "Address")),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: _saveChanges, child: Text("Save Changes")),
          ],
        ),
      ),
    );
  }
}
