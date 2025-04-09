import 'package:flutter/material.dart';

class CategoryItemWidget extends StatefulWidget {
  final IconData icon;
  final String title;
  final String selectedCategory;
  final Function(String) onCategorySelected;

  CategoryItemWidget({
    required this.icon,
    required this.title,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  @override
  _CategoryItemWidgetState createState() => _CategoryItemWidgetState();
}

class _CategoryItemWidgetState extends State<CategoryItemWidget> {
  @override
  Widget build(BuildContext context) {
    bool isSelected = widget.selectedCategory == widget.title;

    return GestureDetector(
      onTap: () {
        widget.onCategorySelected(widget.title);
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isSelected ? Colors.blue : Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Icon(
              widget.icon,
              size: 28,
              color: isSelected ? Colors.white : Colors.blue,
            ),
          ),
          SizedBox(height: 6),
          Text(widget.title, style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
