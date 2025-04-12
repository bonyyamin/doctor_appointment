import 'package:flutter/material.dart';

class TopDoctorCard extends StatelessWidget {
  final String name;
  final String specialty;
  final String rating;
  final String imagePath;

  const TopDoctorCard({
    super.key,
    required this.name,
    required this.specialty,
    required this.rating,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: SizedBox(
        width: MediaQuery.of(context).size.width, // Ensure bounded width
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: 1,
          separatorBuilder: (context, index) => const SizedBox(width: 16),
          itemBuilder:
              (context, index) => DoctorCard(
                name: name,
                specialty: specialty,
                rating: rating,
                imagePath: imagePath,
              ),
        ),
      ),
    );
  }
}

class DoctorCard extends StatelessWidget {
  final String name;
  final String specialty;
  final String rating;
  final String imagePath;

  const DoctorCard({
    super.key,
    required this.name,
    required this.specialty,
    required this.rating,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xFF00C2A8),
      ),
      child: Stack(
        children: [
          _buildCardContent(context),
          _buildDoctorImage(),
          _buildAvailabilityFooter(),
        ],
      ),
    );
  }

  Widget _buildCardContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildRatingAndFavoriteRow(),
          const SizedBox(height: 30),
          Text(
            specialty,
            style: TextStyle(fontSize: 20, color: Color(0xFFC4FAFC)),
          ),
          Text(
            name,
            style: TextStyle(
              fontSize: 28,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'Available Today',
            style: TextStyle(fontSize: 16, color: Color(0xFFC4FAFC)),
          ),
        ],
      ),
    );
  }

  Widget _buildRatingAndFavoriteRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.8),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Icon(Icons.star, color: Colors.amber, size: 20),
              SizedBox(width: 4),
              Text(rating, style: TextStyle(color: Colors.black)),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Icon(Icons.favorite_border, color: Colors.black),
        ),
      ],
    );
  }

  Widget _buildDoctorImage() {
    return Positioned(
      top: 0,
      bottom: 0,
      right: -110,
      left: 0,
      child: Image.asset(imagePath, width: 350, height: 350),
    );
  }

  Widget _buildAvailabilityFooter() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF06AA97).withOpacity(0.7),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Availability • 8 slots",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                Text(
                  "February 2025",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 60,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 7,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (_, index) {
                  return _buildDayAndDateWidget(index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDayAndDateWidget(int index) {
    final days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    final dates = [12, 13, 14, 15, 16, 17, 18];
    final isSelected = index == 3;

    return Column(
      children: [
        Text(
          days[index],
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.white70,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        const SizedBox(height: 4),
        Container(
          width: 36,
          height: 36,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            shape: BoxShape.circle,
          ),
          child: Text(
            '${dates[index]}',
            style: TextStyle(
              color: isSelected ? const Color(0xFF00C2A8) : Colors.white,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ],
    );
  }
}
