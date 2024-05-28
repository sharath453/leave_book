import 'package:flutter/material.dart';
import 'package:leave_book/components/my_button.dart'; // Assuming MyButton is a custom button widget

class FacultyPage extends StatelessWidget {
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
        title: Text('Faculty Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            // College logo (replace with your actual image)
            Image.asset(
              'lib/images/college_logo.png',
              height: 300, // Adjust height to fit buttons
            ),

            const SizedBox(height: 20),

            // Students Details button
            MyButton(
              onTap: () {
                // Handle Students Details button tap
              },
              label: 'Students Details',
            ),

            const SizedBox(height: 15),

            // Faculty Details button
            MyButton(
              onTap: () {
                // Handle Faculty Details button tap
              },
              label: 'Faculty Details',
            ),

            const SizedBox(height: 15),

            // Fine Details button
            MyButton(
              onTap: () {
                // Handle Fine Details button tap
              },
              label: 'Fine Details',
            ),

            const SizedBox(height: 15),

            // Permitted Leaves button
            MyButton(
              onTap: () {
                // Handle Permitted Leaves button tap
              },
              label: 'Permitted Leaves',
            ),
          ],
        ),
      ),
    );
  }
}
