import 'package:flutter/material.dart';
import 'package:leave_book/components/my_button.dart'; // Assuming MyButton is a custom button widget

class HomePage extends StatelessWidget {
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
        title: Text('Home Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            // College logo (replace with your actual image)
            Image.asset(
              'lib/images/alvas_college.png', // Replace with your actual image path
              height: 200, // Adjust height to fit buttons
              fit: BoxFit.cover,
            ),

            const SizedBox(height: 20),

            // Welcome text
            Text(
              'Welcome to Leave App',
              style: TextStyle(
                fontSize: 24,
                color: Colors.black87, // Increased font darkness
                fontFamily: 'Roboto', // Changed font style
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 40),

            // Events button
            MyButton(
              onTap: () {
                // Implement onPressed logic for Events button
              },
              label: 'Events',
            ),

            const SizedBox(height: 15),

            // Attendance Details button
            MyButton(
              onTap: () {
                // Implement onPressed logic for Attendance Details button
              },
              label: 'Attendance Details',
            ),

            const SizedBox(height: 15),

            // Fine & Payments button
            MyButton(
              onTap: () {
                // Implement onPressed logic for Fine & Payments button
              },
              label: 'Fine & Payments',
            ),

            const SizedBox(height: 15),

            // Apply for Leave button
            MyButton(
              onTap: () {
                // Implement onPressed logic for Apply for Leave button
              },
              label: 'Apply for Leave',
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}
