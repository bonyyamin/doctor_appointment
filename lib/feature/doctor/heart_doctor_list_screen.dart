import 'package:flutter/material.dart';

class HeartDoctorListScreen extends StatelessWidget {
  final List<Map<String, String>> doctors = [
    {
      "name": "Dr. Selkon Kane",
      "specialty": "Heart Surgeon",
      "image": "assets/doctor_1.jpg",
      "available": "Available Now",
      "fee": "1000tk",
      "feeTitle": "Consultation Fee"
    },
    {
      "name": "Dr. Watson Mushef",
      "specialty": "Heart Specialist",
      "image": "assets/doctor_2.jpg",
      "available": "Available Now",
      "fee": "1000tk",
      "feeTitle": "Consultation Fee"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Heart Specialists"), backgroundColor: Colors.red),
      backgroundColor: const Color(0xFFEDEDF4),
      body: ListView.builder(
        itemCount: doctors.length,
        itemBuilder: (context, index) {
          final doctor = doctors[index];
          return _buildDoctorCard(doctor);
        },
      ),
    );
  }

  Widget _buildDoctorCard(Map<String, String> doctor) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(doctor["image"]!),
              ),
              title: Text(
                doctor["name"]!,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(doctor["specialty"]!),
            ),
            const Divider(),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          doctor["available"]!,
                          style: const TextStyle(
                              color: Colors.green, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 10),
                        const Text("• Video Consult"),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(doctor["fee"]!),
                        Text(doctor["feeTitle"]!),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle appointment booking action here
                  },
                  child: const Text("Book Appointment >"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
