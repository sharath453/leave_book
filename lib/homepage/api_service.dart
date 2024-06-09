import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<void> submitLeaveApplication(String usn, String name,
      String leaveFrom, String leaveTo, String reason) async {
    final url =
        'http://localhost/submit_leave_application.php'; // Replace this with the URL of your PHP script
    final response = await http.post(
      Uri.parse(url),
      body: {
        'USN': usn,
        'name': name,
        'leave_from': leaveFrom,
        'leave_to': leaveTo,
        'reason': reason,
      },
    );

    if (response.statusCode == 200) {
      // Leave application submitted successfully
      return;
    } else {
      // Handle error
      throw Exception('Failed to submit leave application');
    }
  }
}
