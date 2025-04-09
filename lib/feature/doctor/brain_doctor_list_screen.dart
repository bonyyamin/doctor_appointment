import 'package:flutter/material.dart';

class BrainDoctorListScreen extends StatelessWidget {
  final List<Map<String, String>> doctors = [
    {
      "name": "Dr. Michael Lee",
      "specialty": "Neurosurgeon",
      "image": "assets/doctor_5.jpg",
      "available": "Available Now",
      "fee": "1000tk",
      "feeTitle": "Consultation Fee"
    },
    {
      "name": "Dr. Emily Carter",
      "specialty": "Neurologist",
      "image": "assets/doctor_6.jpg",
      "available": "Available Now",
      "fee": "1000tk",
      "feeTitle": "Consultation Fee"
    },
  ];
  BrainDoctorListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Brain Specialists"), backgroundColor: Colors.purple),
      backgroundColor: Color(0xFFEDEDF4),
      body: ListView.builder(
        itemCount: doctors.length,
        itemBuilder: (context, index) {
          final doctor = doctors[index];
          return _buildDoctorCard(context, doctor);
        },
      ),
    );
  }

  Widget _buildDoctorCard(BuildContext context, Map<String, String> doctor) {
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
                    //TODO: notepad bookappoinment screen
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
