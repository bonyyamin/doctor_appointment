import 'package:doctor_appointment/feature/appointments/appointment_details_screen.dart';
import 'package:flutter/material.dart';

class AppointmentScreen extends StatelessWidget {
  final List<Map<String, String>> appointments = [
    {
      "doctor": "Dr. Selkon Kane",
      "specialty": "Heart Surgeon",
      "date": "March 20, 2025",
      "time": "10:30 AM",
      "image": "assets/images/doctor/doctor_1.jpg"
    },
    {
      "doctor": "Dr. Alice Johnson",
      "specialty": "Dental Surgeon",
      "date": "March 22, 2025",
      "time": "2:00 PM",
      "image": "assets/images/doctor/doctor_4.jpg"
    },
    {
      "doctor": "Dr. Michael Lee",
      "specialty": "Neurosurgeon",
      "date": "March 25, 2025",
      "time": "11:15 AM",
      "image": "assets/images/doctor/doctor_5.jpg"
    },
  ];

   AppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Appointments"),
          backgroundColor: Colors.blue),
      backgroundColor: const Color(0xFFEDEDF4),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: appointments.length,
          itemBuilder: (context, index) {
            final appointment = appointments[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 10),
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16),
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(appointment["image"]!),
                ),
                title: Text(
                  appointment["doctor"]!,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(appointment["specialty"]!),
                    const SizedBox(height: 4),
                    Text(
                      "📅 ${appointment["date"]!}  |  ⏰ ${appointment["time"]!}",
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    ),
                  ],
                ),
                trailing:
                    const Icon(Icons.arrow_forward_ios, color: Colors.blue),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          AppointmentDetailsScreen(appointment: appointment),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
