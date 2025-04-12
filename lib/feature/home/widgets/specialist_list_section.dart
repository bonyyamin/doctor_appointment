import 'package:flutter/material.dart';
import 'package:doctor_appointment/feature/home/widgets/card_widget.dart';

class SpecialistListSection extends StatelessWidget {
  final String selectedCategory;
  final List<Map<String, String>> doctors;

  const SpecialistListSection({
    super.key,
    required this.selectedCategory,
    required this.doctors,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$selectedCategory Specialists",
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: doctors.length,
            itemBuilder: (context, index) {
              final doctor = doctors[index];
              return CardWidget(
                name: doctor["name"]!,
                specialty: doctor["specialty"]!,
                imagePath: doctor["image"]!,
              );
            },
          ),
        ),
      ],
    );
  }
}
