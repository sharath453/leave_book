import 'package:flutter/material.dart';
import 'package:leave_book/components/my_button.dart';

class Students extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Student Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            // Enter Attendance button
            MyButton(
              onTap: () {
                // Handle Enter Attendance button tap
              },
              label: 'Enter Attendance',
            ),

            const SizedBox(height: 15),

            // View Attendance button
            MyButton(
              onTap: () {
                // Handle View Attendance button tap
              },
              label: 'View Attendance',
            ),

            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
