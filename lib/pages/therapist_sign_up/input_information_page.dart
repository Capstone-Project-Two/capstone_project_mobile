import 'package:capstone_project_mobile/layouts/my_app_bar.dart';
import 'package:capstone_project_mobile/pages/therapist_sign_up/input_nid_page.dart';
import 'package:capstone_project_mobile/pages/login/login_email_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BecomeTherapistPage1 extends StatelessWidget {
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
                      CupertinoPageRoute(
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
    TextTheme textTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align children to the start
          children: [
            Text(
              "Input Personal Information",
              style: textTheme.displayMedium!.copyWith(
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 20),
            _buildTextField(
              labelText: 'First Name',
              keyboardType: TextInputType.name,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your first name';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            _buildTextField(
              labelText: 'Last Name',
              keyboardType: TextInputType.name,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your last name';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            _buildTextField(
              labelText: 'Email',
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                  return 'Please enter a valid email address';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            _buildNextButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextInputType keyboardType,
    required String labelText,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: labelText, // Label text
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
        validator: validator);
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
              CupertinoPageRoute(builder: (context) => BecomeTherapistPage2()),
            );
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          textStyle: const TextStyle(fontSize: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
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
