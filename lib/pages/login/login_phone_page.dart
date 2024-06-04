import 'package:capstone_project_mobile/layouts/my_app_bar.dart';
import 'package:capstone_project_mobile/pages/login/login_email_page.dart';
import 'package:capstone_project_mobile/theme/base_app_colors.dart';
import 'package:flutter/material.dart';

class LoginPhone extends StatefulWidget {
  const LoginPhone({super.key});

  @override
  LoginPhoneState createState() => LoginPhoneState();
}

class LoginPhoneState extends State<LoginPhone> {
  void _loginEmail() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginEmail()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: "Login", actionsEnabled: false),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 20),
            const Text(
              'Enter your phone number',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Enter Phone Number',
                prefixText: '+855 | ',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle next action
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                backgroundColor: BaseAppColors.primaryColor,
              ),
              child: const Text(
                'Next',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 10),
            Text(
              'Sign up with',
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () {
                // Handle sign up with email
                _loginEmail();
              },
              icon: const Icon(Icons.email_outlined),
              label: const Text('Email'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: const BorderSide(color: Colors.black),
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () {
                // Handle sign up with Google
              },
              icon: Image.asset(
                'lib/assets/icons/google.png', // Ensure you have a Google icon in your assets
                height: 25,
                width: 25,
              ),
              label: const Text('Google'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: const BorderSide(color: Colors.black),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text("Already have an account? "),
                GestureDetector(
                  onTap: () {
                    // Handle sign in
                  },
                  child: const Text(
                    'Sign In',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
