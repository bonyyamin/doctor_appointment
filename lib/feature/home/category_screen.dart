import 'package:doctor_appointment/feature/doctor/brain_doctor_list_screen.dart';
import 'package:doctor_appointment/feature/doctor/dental_doctor_list_screen.dart';
import 'package:doctor_appointment/feature/doctor/heart_doctor_list_screen.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  final Function(String) onCategorySelected;

  const CategoryScreen({super.key, required this.onCategorySelected});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> categories = [
      {
        "title": "Heart",
        "subtitle": "Cardiologists for heart-related diseases",
        "icon": Icons.favorite,
        "screen": HeartDoctorListScreen(),
      },
      {
        "title": "Dental",
        "subtitle": "Dentists for oral health and dental care",
        "icon": Icons.medical_services,
        "screen": DentalDoctorListScreen(),
      },
      {
        "title": "Brain",
        "subtitle": "Neurologists for brain and nervous system disorders",
        "icon": Icons.psychology,
        "screen": BrainDoctorListScreen(),
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      backgroundColor: Color(0xFFEDEDF4),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              margin: EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                contentPadding: EdgeInsets.all(16),
                leading: CircleAvatar(
                  backgroundColor: Colors.blue.shade100,
                  child: Icon(category["icon"], color: Colors.blue, size: 28),
                ),
                title: Text(
                  category["title"]!,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(category["subtitle"]!),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.blue),
                onTap: () {
                  onCategorySelected(category["title"]!);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => category["screen"]),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
