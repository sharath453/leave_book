import 'package:flutter/material.dart';
import 'package:leave_book/components/my_button.dart';
import 'package:leave_book/homepage/events_page.dart';

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
              'lib/images/alvas_college.png',
              height: 200,
              fit: BoxFit.cover,
            ),

            const SizedBox(height: 20),

            // Welcome text
            Text(
              'Welcome to Leave App',
              style: TextStyle(
                fontSize: 24,
                color: Colors.black87,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 40),

            // Events button
            MyButton(
              onTap: () {
                // Navigate to the EventsPage
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EventsPage(),
                  ),
                );
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
