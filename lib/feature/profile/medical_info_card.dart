import 'package:flutter/material.dart';
import '../models/user_model.dart';

class MedicalInfoCard extends StatelessWidget {
  final UserModel user;

  const MedicalInfoCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.bloodtype, color: Colors.red),
            title: Text("Blood Type"),
            subtitle: Text(user.bloodType),
          ),
          ExpansionTile(
            leading: Icon(Icons.history, color: Colors.green),
            title: Text("Medical History"),
            children: user.medicalHistory
                .map((history) => ListTile(title: Text(history)))
                .toList(),
          ),
          ExpansionTile(
            leading: Icon(Icons.medical_services, color: Colors.orange),
            title: Text("Current Medications"),
            children: user.currentMedications
                .map((med) => ListTile(title: Text(med)))
                .toList(),
          ),
          ExpansionTile(
            leading: Icon(Icons.local_hospital, color: Colors.purple),
            title: Text("Past Surgeries"),
            children: user.pastSurgeries
                .map((surgery) => ListTile(title: Text(surgery)))
                .toList(),
          ),
        ],
      ),
    );
  }
}
