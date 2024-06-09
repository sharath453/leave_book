import 'package:flutter/material.dart';
import 'package:leave_book/components/my_button.dart';
import 'package:leave_book/components/my_textfield.dart';
import 'package:leave_book/homepage/home_page.dart';
import 'package:leave_book/pages/faculty_page.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void signUserIn(BuildContext context) async {
    String username = usernameController.text;
    String password = passwordController.text;

    if (username.isNotEmpty && password.isNotEmpty) {
      try {
        final response = await http.post(
          Uri.parse('http://192.168.171.205/database.php'),
          headers: <String, String>{
            'Content-Type': 'application/json',
          },
          body: jsonEncode(<String, String>{
            'username': username,
            'password': password,
          }),
        );

        if (response.statusCode == 200) {
          Map<String, dynamic> data = jsonDecode(response.body);
          String role = data['role'];

          if (role == "student") {
            // Navigate to the HomePage for students
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(
                  username: '',
                  name: '',
                ),
              ),
            );
          } else if (role == "faculty") {
            // Navigate to the FacultyPage for faculty
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => FacultyPage(),
              ),
            );
          } else {
            // Show error message indicating invalid role
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Invalid role.'),
                duration: Duration(seconds: 2),
              ),
            );
          }
        } else {
          // Show error message indicating failed request
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Failed to sign in.'),
              duration: Duration(seconds: 2),
            ),
          );
        }
      } catch (e) {
        // Show error message indicating exception
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: $e'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } else {
      // Show error message indicating that both fields are required
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter both username and password.'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),

                // college logo (replace with your actual image)
                Image.asset(
                  'lib/images/college_logo.png',
                  height: 250,
                ),

                const SizedBox(height: 50),

                // welcome back, you've been missed!
                Text(
                  'Welcome back, you\'ve been missed!',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 25),

                // username textfield
                MyTextField(
                  controller: usernameController,
                  hintText: 'Username',
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                // password textfield
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),

                const SizedBox(height: 20),

                // sign in button
                MyButton(
                  onTap: () => signUserIn(context),
                  label: 'Sign In',
                ),

                const SizedBox(height: 50),

                // Other UI elements...
              ],
            ),
          ),
        ),
      ),
    );
  }
}
