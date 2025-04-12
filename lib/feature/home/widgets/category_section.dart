import 'package:flutter/material.dart';
import 'package:doctor_appointment/feature/home/category_screen.dart';
import 'package:doctor_appointment/feature/home/widgets/category_item.dart';

class CategorySection extends StatelessWidget {
  final String selectedCategory;
  final Function(String) onCategorySelected;

  const CategorySection({
    super.key,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Category", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoryScreen(
                      onCategorySelected: (category) {
                        onCategorySelected(category);
                      },
                    ),
                  ),
                );
              },
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: const Icon(Icons.category, size: 28, color: Colors.blue),
                  ),
                  const SizedBox(height: 6),
                  const Text("See All", style: TextStyle(fontSize: 14)),
                ],
              ),
            ),
            CategoryItemWidget(
              icon: Icons.favorite,
              title: "Heart",
              selectedCategory: selectedCategory,
              onCategorySelected: onCategorySelected,
            ),
            CategoryItemWidget(
              icon: Icons.medical_services,
              title: "Dental",
              selectedCategory: selectedCategory,
              onCategorySelected: onCategorySelected,
            ),
            CategoryItemWidget(
              icon: Icons.psychology,
              title: "Brain",
              selectedCategory: selectedCategory,
              onCategorySelected: onCategorySelected,
            ),
          ],
        ),
      ],
    );
  }
}
