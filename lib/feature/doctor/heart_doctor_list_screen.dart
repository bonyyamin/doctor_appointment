import 'package:flutter/material.dart';
import 'package:doctor_appointment/models/doctor.dart';
import 'package:doctor_appointment/widgets/doctor_card.dart';

class HeartDoctorListScreen extends StatelessWidget {
  final List<Doctor> doctors = [
    Doctor.fromMap({
      "name": "Dr. Selkon Kane",
      "specialty": "Heart Surgeon",
      "image": "assets/images/doctor/doctor_1.jpg",
      "available": "Available Now",
      "fee": "1000tk",
      "feeTitle": "Consultation Fee",
    }),
    Doctor.fromMap({
      "name": "Dr. Watson Mushef",
      "specialty": "Heart Specialist",
      "image": "assets/images/doctor/doctor_2.jpg",
      "available": "Available Now",
      "fee": "1000tk",
      "feeTitle": "Consultation Fee",
    }),
  ];

  HeartDoctorListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Heart Specialists"),
        backgroundColor: Colors.red,
      ),
      backgroundColor: const Color(0xFFEDEDF4),
      body: ListView.builder(
        itemCount: doctors.length,
        itemBuilder:
            (context, index) =>
                DoctorCard(doctor: doctors[index], imagePath: ''),
      ),
    );
  }
}
