import 'package:flutter/material.dart';

class EventsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Events'),
      ),
      body: ListView(
        children: [
          EventItem(
            image:
                'lib/images/vijayprakash_event.jpg', // Vijay Prakash event image path
            description:
                'Alva\'s Education Foundation organizes various cultural events throughout the year. One of the highlights is the annual performance by the renowned playback singer Vijay Prakash. He mesmerizes the audience with his soulful renditions and leaves a lasting impact on everyone.',
          ),
          EventItem(
            image:
                'lib/images/alvas_pragathi.png', // Alvas Pragathi event image path
            description:
                'Alva\'s College Moodbidre, a constituent college of Alva\'s Education Foundation, is known for its academic excellence and vibrant cultural environment. Every year, Alva\'s Pragathi celebrates the talents of students and showcases the rich cultural heritage of the region.',
          ),
          EventItem(
            image:
                'lib/images/Alvas_Virasat_award.jpg', // Alvas Virasat award event image path
            description:
                'The Alva\'s Virasat Awards recognize individuals who have made significant contributions to art, culture, and society. These awards serve as a platform to honor and celebrate excellence in various fields.',
          ),
          EventItem(
            image:
                'lib/images/republic_day.jpg', // Republic Day event image path
            description:
                'Alva\'s College proudly commemorates the Republic Day of India with patriotic fervor and enthusiasm. The college organizes various events and activities to instill a sense of national pride and unity among students.',
          ),
          EventItem(
            image:
                'lib/images/alvas_virasat.jpg', // Alvas Virasat event image path
            description:
                'Alva\'s Virasat is a cultural extravaganza that showcases the rich heritage and diversity of Indian art forms. The event features performances by renowned artists and provides a platform for emerging talent to showcase their skills.',
          ),
        ],
      ),
    );
  }
}

class EventItem extends StatelessWidget {
  final String image;
  final String description;

  EventItem({required this.image, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () {
          // Show dialog with event description
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Event Description'),
                content: Text(description),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Close'),
                  ),
                ],
              );
            },
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              image,
              fit: BoxFit.cover,
              height: 200, // Adjust height as needed
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                description,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
