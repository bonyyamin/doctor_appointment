import 'package:flutter/material.dart';
import 'package:doctor_appointment/models/doctor.dart';
import 'package:doctor_appointment/widgets/doctor_card.dart';

class BrainDoctorListScreen extends StatelessWidget {
  final List<Doctor> doctors = [
    Doctor.fromMap({
      "name": "Dr. Michael Lee",
      "specialty": "Neurosurgeon",
      "image": "assets/images/doctor/doctor_5.jpg",
      "available": "Available Now",
      "fee": "1000tk",
      "feeTitle": "Consultation Fee",
    }),
    Doctor.fromMap({
      "name": "Dr. Emily Carter",
      "specialty": "Neurologist",
      "image": "assets/images/doctor/doctor_6.jpg",
      "available": "Available Now",
      "fee": "1000tk",
      "feeTitle": "Consultation Fee",
    }),
  ];

  BrainDoctorListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Brain Specialists"),
        backgroundColor: Colors.purple,
      ),
      backgroundColor: const Color(0xFFEDEDF4),
      body: ListView.builder(
        itemCount: doctors.length,
        itemBuilder: (context, index) => DoctorCard(doctor: doctors[index], imagePath: '',),
      ),
    );
  }
}
