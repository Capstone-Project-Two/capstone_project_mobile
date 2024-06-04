import 'package:capstone_project_mobile/pages/become_therapist_page/become_therapist_page1.dart';
import 'package:flutter/material.dart';

// Import your BecomeTherapistPage class here
// import 'become_therapist_page.dart'; // Assuming the file is named become_therapist_page.dart

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Use Navigator.push to navigate to BecomeTherapistPage
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BecomeTherapistPage1()),
                );
              },
              child: const Text('Go to Become Therapist Page'),
            ),
          ],
        ),
      ),
    );
  }
}
