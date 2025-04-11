import 'package:flutter/material.dart';
import 'package:doctor_appointment/models/doctor.dart';
import 'package:doctor_appointment/feature/appointments/book_appointment/book_appointment_screen.dart';

class DoctorCard extends StatelessWidget {
  final Doctor doctor;

  const DoctorCard({super.key, required this.doctor, required String imagePath});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDoctorInfo(),
            const Divider(),
            _buildDoctorDetails(),
            const SizedBox(height: 10),
            _buildBookButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildDoctorInfo() {
    return ListTile(
      leading: CircleAvatar(
        radius: 30,
        backgroundImage: AssetImage(doctor.image),
      ),
      title: Text(
        doctor.name,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(doctor.specialty),
    );
  }

  Widget _buildDoctorDetails() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Text(
              doctor.available,
              style: const TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 10),
            const Text("• Video Consult"),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(doctor.fee), Text(doctor.feeTitle)],
        ),
      ],
    );
  }

  Widget _buildBookButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _navigateToBooking(context),
      child: const Text("Book Appointment >"),
    );
  }

  void _navigateToBooking(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => BookAppointmentScreen(
              doctorName: doctor.name,
              doctorSpecialty: doctor.specialty,
              doctorImage: doctor.image,
            ),
      ),
    );
  }
}
