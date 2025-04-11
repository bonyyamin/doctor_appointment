import 'package:flutter/material.dart';
import 'package:doctor_appointment/models/doctor.dart';
import 'package:doctor_appointment/widgets/doctor_card.dart';

class DentalDoctorListScreen extends StatelessWidget {
  final List<Doctor> doctors = [
    Doctor.fromMap({
      "name": "Dr. Robert Brown",
      "specialty": "Orthodontist",
      "image": "assets/images/doctor/doctor_3.jpg",
      "available": "Available Now",
      "fee": "1000tk",
      "feeTitle": "Consultation Fee",
    }),
    Doctor.fromMap({
      "name": "Dr. Alice Johnson",
      "specialty": "Dental Surgeon",
      "image": "assets/images/doctor/doctor_4.jpg",
      "available": "Available Now",
      "fee": "1000tk",
      "feeTitle": "Consultation Fee",
    }),
  ];

  DentalDoctorListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dental Specialists"),
        backgroundColor: Colors.teal,
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
