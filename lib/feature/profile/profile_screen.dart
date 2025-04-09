import 'package:doctor_appointment/feature/profile/medical_info_card.dart';
import 'package:doctor_appointment/feature/profile/profile_info_card.dart';
import 'package:flutter/material.dart';
import '../models/user_model.dart';
import 'edit_profile_screen.dart';

class ProfileScreen extends StatelessWidget {
  final UserModel user = UserModel(
    profilePicture: "assets/profile_1.png",
    fullName: "John Doe",
    dateOfBirth: "1990-05-15",
    gender: "Male",
    contact: "+1 234 567 890",
    address: "123 Main St, New York, NY",
    bloodType: "O+",
    medicalHistory: ["Diabetes", "Hypertension"],
    currentMedications: ["Metformin", "Amlodipine"],
    chronicConditions: ["Diabetes"],
    pastSurgeries: ["Appendectomy (2015)"],
    appointmentHistory: [
      "Cardiologist - Jan 10, 2024",
      "Dentist - Mar 5, 2024"
    ],
  );

  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Profile"),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => EditProfileScreen(user: user)),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// Profile Picture
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(user.profilePicture),
            ),
            SizedBox(height: 10),
            Text(user.fullName,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            Text(user.contact, style: TextStyle(color: Colors.grey)),

            SizedBox(height: 20),

            /// Profile Information
            ProfileInfoCard(user: user),

            SizedBox(height: 20),

            /// Medical Information
            MedicalInfoCard(user: user),

            SizedBox(height: 20),

            /// Appointment History
            Card(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: ExpansionTile(
                title: Text("Appointment History",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                children: user.appointmentHistory.map((appointment) {
                  return ListTile(
                    title: Text(appointment),
                    leading: Icon(Icons.calendar_today, color: Colors.blue),
                  );
                }).toList(),
              ),
            ),

            /// Account Settings
            Card(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                leading: Icon(Icons.settings, color: Colors.blue),
                title: Text("Account Settings"),
                onTap: () {
                  // Navigate to settings screen
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
