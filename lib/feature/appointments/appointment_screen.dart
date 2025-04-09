import 'package:flutter/material.dart';

class AppointmentsScreen extends StatelessWidget {
  const AppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appointments Screen'),
      ),
      body: Center(
        child: Text(
          'Welcome to the Appointments Screen!',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}