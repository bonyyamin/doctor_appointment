import 'package:doctor_appointment/feature/home/widgets/category_section.dart';
import 'package:doctor_appointment/feature/home/widgets/header_section.dart';
import 'package:doctor_appointment/feature/home/widgets/search_section.dart';
import 'package:doctor_appointment/feature/home/widgets/specialist_list_section.dart';
import 'package:doctor_appointment/feature/home/widgets/top_doctors_section.dart';
import 'package:flutter/material.dart';

class HomeScreenContent extends StatefulWidget {
  const HomeScreenContent({super.key});

  @override
  HomeScreenContentState createState() => HomeScreenContentState();
}

class HomeScreenContentState extends State<HomeScreenContent> {
  String selectedCategory = "Heart";

  final List<Map<String, String>> doctors = [
    {
      "name": "Dr. Selkon Kane",
      "specialty": "Heart",
      "image": "assets/images/doctor/doctor_1.jpg",
    },
    {
      "name": "Dr. Watson Mushef",
      "specialty": "Heart",
      "image": "assets/images/doctor/doctor_2.jpg",
    },
    {
      "name": "Dr. Emily Smith",
      "specialty": "Dental",
      "image": "assets/images/doctor/doctor_3.jpg",
    },
    {
      "name": "Dr. Robert Brown",
      "specialty": "Dental",
      "image": "assets/images/doctor/doctor_4.jpg",
    },
    {
      "name": "Dr. Alice Johnson",
      "specialty": "Brain",
      "image": "assets/images/doctor/doctor_5.jpg",
    },
    {
      "name": "Dr. Michael Lee",
      "specialty": "Brain",
      "image": "assets/images/doctor/doctor_6.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> filteredDoctors =
        doctors
            .where((doctor) => doctor["specialty"] == selectedCategory)
            .toList();

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderSection(),
            const SizedBox(height: 20),
            const Text(
              "Find your desired\nspecialist",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const SearchSection(),
            const SizedBox(height: 24),
            const TopDoctorsSection(),
            const SizedBox(height: 24),
            CategorySection(
              selectedCategory: selectedCategory,
              onCategorySelected: (category) {
                setState(() => selectedCategory = category);
              },
            ),

            const SizedBox(height: 24),
            SpecialistListSection(
              selectedCategory: selectedCategory,
              doctors: filteredDoctors,
            ),
          ],
        ),
      ),
    );
  }
}
