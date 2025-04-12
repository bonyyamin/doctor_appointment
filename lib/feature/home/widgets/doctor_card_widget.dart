import 'package:flutter/material.dart';

class DoctorCardWidget extends StatelessWidget {
  final String name;
  final String specialty;
  final double rating;
  final int reviews;
  final String imageUrl;
  final bool isHighlighted;

  const DoctorCardWidget({
    super.key,
    required this.name,
    required this.specialty,
    required this.rating,
    required this.reviews,
    required this.imageUrl,
    this.isHighlighted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isHighlighted ? const Color(0xFF1CC3AE) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          if (!isHighlighted)
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 6,
              offset: const Offset(0, 2),
            )
        ],
      ),
      width: 160,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 24,
            backgroundImage: NetworkImage(imageUrl),
          ),
          const SizedBox(height: 12),
          Text(
            name,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isHighlighted ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            specialty,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isHighlighted ? Colors.white70 : Colors.black54,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.star, size: 16, color: Colors.amber),
              const SizedBox(width: 4),
              Text(
                rating.toStringAsFixed(1),
                style: TextStyle(
                  color: isHighlighted ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                '($reviews Reviews)',
                style: TextStyle(
                  color: isHighlighted ? Colors.white70 : Colors.black45,
                  fontSize: 12,
                ),
              )
            ],
          ),
          const SizedBox(height: 16),
          Container(
            height: 32,
            width: 32,
            decoration: BoxDecoration(
              color: isHighlighted ? Colors.white : Colors.grey.shade200,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.arrow_forward,
              size: 16,
              color: isHighlighted ? const Color(0xFF1CC3AE) : Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
