import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:leave_book/homepage/api_service.dart';

class LeaveFormPage extends StatefulWidget {
  final String username;
  final String name;

  LeaveFormPage({required this.username, required this.name});

  @override
  _LeaveFormPageState createState() => _LeaveFormPageState();
}

class _LeaveFormPageState extends State<LeaveFormPage> {
  final _reasonController = TextEditingController();

  DateTime? _selectedLeaveFrom;
  DateTime? _selectedLeaveTo;

  void _submitLeaveApplication() async {
    final usn = widget.username;
    final name = widget.name;
    final leaveFrom = _selectedLeaveFrom;
    final leaveTo = _selectedLeaveTo;
    final reason = _reasonController.text;

    try {
      if (leaveFrom != null && leaveTo != null) {
        await ApiService.submitLeaveApplication(
            usn,
            name,
            DateFormat('yyyy-MM-dd').format(leaveFrom),
            DateFormat('yyyy-MM-dd').format(leaveTo),
            reason);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Leave application submitted successfully')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please select leave dates')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  String _formatDate(DateTime? date) {
    if (date != null) {
      return DateFormat('yyyy-MM-dd').format(date);
    } else {
      return 'Select Date';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leave Application Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                showDatePicker(
                  context: context,
                  initialDate: _selectedLeaveFrom ?? DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                ).then((date) {
                  if (date != null) {
                    setState(() {
                      _selectedLeaveFrom = date;
                    });
                  }
                });
              },
              child: Text(_formatDate(_selectedLeaveFrom)),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                showDatePicker(
                  context: context,
                  initialDate: _selectedLeaveTo ?? DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                ).then((date) {
                  if (date != null) {
                    setState(() {
                      _selectedLeaveTo = date;
                    });
                  }
                });
              },
              child: Text(_formatDate(_selectedLeaveTo)),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _reasonController,
              decoration: InputDecoration(labelText: 'Reason for Leave'),
              maxLines: 3,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitLeaveApplication,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
