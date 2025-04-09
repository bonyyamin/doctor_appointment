import 'package:flutter/material.dart';

class AppointmentDetailsScreen extends StatelessWidget {
  final Map<String, String> appointment;

  const AppointmentDetailsScreen({super.key, required this.appointment});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Appointment Details"),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: const Color(0xFFEDEDF4),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage:
                  AssetImage(appointment["image"]!), // Correct key here
            ),
            const SizedBox(height: 16),
            Text(
              appointment["doctor"]!,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              appointment["specialty"]!,
              style: TextStyle(fontSize: 18, color: Colors.grey[700]),
            ),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 16),
            _buildDetailRow(Icons.calendar_today, "Date", appointment["date"]!),
            const SizedBox(height: 10),
            _buildDetailRow(Icons.access_time, "Time", appointment["time"]!),
            const SizedBox(height: 10),
            _buildDetailRow(
                Icons.location_on, "Location", "City Hospital, Room 305"),
            const SizedBox(height: 10),
            _buildDetailRow(Icons.note, "Notes",
                "Follow-up consultation for test results."),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              icon: const Icon(Icons.cancel, color: Colors.white),
              label: const Text("Cancel Appointment",
                  style: TextStyle(color: Colors.white)),
              onPressed: () {
                // Logic to cancel the appointment
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Appointment Cancelled")),
                );
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, color: Colors.blue),
        const SizedBox(width: 12),
        Text(
          "$label: ",
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
