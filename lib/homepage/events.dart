import 'package:flutter/material.dart';

class EventsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recent Events'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              EventCard(
                imagePath:
                    'lib/images/event1.png', // Replace with your actual image path
                description: 'Event 1 Description: This event was about...',
              ),
              EventCard(
                imagePath:
                    'lib/images/event2.png', // Replace with your actual image path
                description: 'Event 2 Description: This event focused on...',
              ),
              EventCard(
                imagePath:
                    'lib/images/event3.png', // Replace with your actual image path
                description: 'Event 3 Description: In this event, we...',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final String imagePath;
  final String description;

  const EventCard({
    required this.imagePath,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Image.asset(
            imagePath,
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              description,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
                fontFamily: 'Roboto',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
