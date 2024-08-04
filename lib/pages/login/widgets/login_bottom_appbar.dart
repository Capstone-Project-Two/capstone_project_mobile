import 'package:capstone_project_mobile/pages/login/widgets/google_login.dart';
import 'package:capstone_project_mobile/pages/login/widgets/phone_login.dart';
import 'package:capstone_project_mobile/pages/login/widgets/sign_up_button.dart';
import 'package:capstone_project_mobile/pages/login/widgets/thearapist_sign_up_button.dart';
import 'package:flutter/material.dart';

class LoginBottomAppBar extends StatelessWidget {
  final VoidCallback onLoginPhone;
  final VoidCallback onTherapistSignUp;
  final VoidCallback onRegister;

  const LoginBottomAppBar({
    super.key,
    required this.onLoginPhone,
    required this.onTherapistSignUp,
    required this.onRegister,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: Colors.white,
        elevation: 0,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Sign in with",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 20),
              PhoneSignInButton(onLoginPhone: onLoginPhone),
              const SizedBox(height: 20),
              const GoogleSignInButton(),
              const SizedBox(height: 20),
              const SignUpText(),
              const SizedBox(height: 10),
              TherapistSignUp(onTherapistSignUp: onTherapistSignUp),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: onRegister,
                child: const Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
