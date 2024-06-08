// lib/homepage/api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://localhost/leave_application/';

  static Future<Map<String, dynamic>> login(
      String username, String password) async {
    final response = await http.post(
      Uri.parse('${baseUrl}login.php'),
      body: {
        'username': username,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to log in');
    }
  }

  static Future<Map<String, dynamic>> getLeaveFormDetails(
      String username) async {
    final response = await http.post(
      Uri.parse('${baseUrl}leave_form.php'),
      body: {
        'username': username,
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to fetch leave form details');
    }
  }
}
