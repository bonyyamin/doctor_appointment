import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import the intl package

class CurrentDate extends StatelessWidget {
  const CurrentDate({super.key});

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat("dd MMMM, yyyy").format(DateTime.now());
    return Text("Today, $formattedDate", style: TextStyle(fontSize: 16));
  }
}
