import 'package:flutter/material.dart';
import 'package:doctor_appointment/feature/home/widgets/top_doctor_card.dart';

class TopDoctorsSection extends StatelessWidget {
  const TopDoctorsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Top Doctors',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 24),
        SizedBox(
          height: 350,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: const [
                TopDoctorCard(
                  name: "Dr Johan\nJanson",
                  specialty: "Cardiologist",
                  rating: "4.8",
                  imagePath: "assets/images/doctor/top_doctor1.png",
                ),
                TopDoctorCard(
                  name: "Dr Sarah\nWilson",
                  specialty: "Neurologist",
                  rating: "4.9",
                  imagePath: "assets/images/doctor/top_doctor2.png",
                ),
                TopDoctorCard(
                  name: "Dr Mike\nPeterson",
                  specialty: "Dentist",
                  rating: "4.7",
                  imagePath: "assets/images/doctor/top_doctor3.png",
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
