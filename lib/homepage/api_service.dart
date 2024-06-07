import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LeaveApplication extends StatefulWidget {
  final String username;

  LeaveApplication({required this.username});

  @override
  _LeaveApplicationState createState() => _LeaveApplicationState();
}

class _LeaveApplicationState extends State<LeaveApplication> {
  final TextEditingController _leaveFromDateController =
      TextEditingController();
  final TextEditingController _leaveToDateController = TextEditingController();
  final TextEditingController _reasonController = TextEditingController();

  String _fromAddress = '';
  String _toAddress = 'Manjunath Kotari';
  String _todayDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Apply for Leave'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('From: $_fromAddress'),
            Text('To: $_toAddress'),
            Text('Date: $_todayDate'),
            TextField(
              controller: _leaveFromDateController,
              readOnly: true,
              onTap: () => _selectDate(context, _leaveFromDateController),
              decoration: InputDecoration(
                labelText: 'Leave From Date',
              ),
            ),
            TextField(
              controller: _leaveToDateController,
              readOnly: true,
              onTap: () => _selectDate(context, _leaveToDateController),
              decoration: InputDecoration(
                labelText: 'Leave To Date',
              ),
            ),
            TextField(
              controller: _reasonController,
              decoration: InputDecoration(
                labelText: 'Reason',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _submitLeaveApplication,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        controller.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  void _submitLeaveApplication() {
    // Implement leave application submission
  }
}
