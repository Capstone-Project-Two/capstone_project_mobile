// ignore_for_file: prefer_const_constructors

import 'package:capstone_project_mobile/layouts/my_app_bar.dart';
import 'package:capstone_project_mobile/pages/become_therapist_page/become_therapist_page2.dart';
import 'package:capstone_project_mobile/pages/login/login_email_page.dart';
import 'package:flutter/material.dart';

class BecomeTherapistPage1 extends StatelessWidget {
  final img1 =
      "https://i.pinimg.com/736x/d2/28/6e/d2286eb8935144d6cbfa0b40744aa41e.jpg";
  final img2 =
      "https://w0.peakpx.com/wallpaper/681/788/HD-wallpaper-hualian-hua-cheng-mxtx-tgcf-tian-guan-ci-fu-xie-lian-thumbnail.jpg";

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  BecomeTherapistPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: const MyAppBar(
        title: "Therapist Sign Up",
        actionsEnabled: true,
      ),
      body: _buildBody(context),
      bottomNavigationBar: _buildBottomAppBar(context),
    );
  }

  Widget _buildBottomAppBar(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      height: 50, // Set the desired height for the BottomAppBar
      child: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: colorScheme.background,
        elevation: 0,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Already have an account?",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginEmail()));
                },
                child: const Text(
                  "Sign In",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align children to the start
          children: [
            const Text(
              "Input Personal Information",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 20),
            _buildFirstName(),
            const SizedBox(height: 20),
            _buildLastName(),
            const SizedBox(height: 20),
            _buildEmailTextField(),
            const SizedBox(height: 20),
            _buildNextButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildEmailTextField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "Email", // Label text
        labelStyle: const TextStyle(
          color: Colors.grey, // Label color
          fontSize: 18,
        ),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 2.0,
          ),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email';
        }
        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
          return 'Please enter a valid email address';
        }
        return null;
      },
    );
  }

  Widget _buildFirstName() {
    return TextFormField(
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        labelText: "First Name", // Label text
        labelStyle: const TextStyle(
          color: Colors.grey, // Label color
          fontSize: 18,
        ),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 2.0,
          ),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your first name';
        }
        return null;
      },
    );
  }

  Widget _buildLastName() {
    return TextFormField(
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        labelText: "Last Name", // Label text
        labelStyle: const TextStyle(
          color: Colors.grey, // Label color
          fontSize: 18,
        ),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 2.0,
          ),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your Last name';
        }
        return null;
      },
    );
  }

  Widget _buildNextButton(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const BecomeTherapistPage2()),
            );
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          textStyle: const TextStyle(fontSize: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 10,
          ),
        ),
        child: const Text('Next'),
      ),
    );
  }
}
