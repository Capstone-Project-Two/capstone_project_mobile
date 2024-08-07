// ignore_for_file: avoid_print

import 'package:capstone_project_mobile/core/controller/auth_controller.dart';
import 'package:capstone_project_mobile/layouts/my_app_bar.dart';
import 'package:capstone_project_mobile/layouts/layout_page.dart';
import 'package:capstone_project_mobile/pages/login/widgets/email_field.dart';
import 'package:capstone_project_mobile/pages/login/widgets/forget_password.dart';
import 'package:capstone_project_mobile/pages/login/widgets/login_bottom_appbar.dart';
import 'package:capstone_project_mobile/pages/login/widgets/password_field.dart';
import 'package:capstone_project_mobile/pages/login/widgets/sign_in_button.dart';
import 'package:capstone_project_mobile/pages/therapist_sign_up/input_information_page.dart';
import 'package:capstone_project_mobile/shared/loading_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login_phone_page.dart';

class LoginEmail extends StatefulWidget {
  const LoginEmail({super.key});

  @override
  LoginEmailState createState() => LoginEmailState();
}

class LoginEmailState extends State<LoginEmail> {
  bool _obscureText = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthController _authController = Get.put(AuthController());

  void _signIn() {
    // Print email and password to the console
    print("Email: ${_emailController.text.trim()}");
    print("Password: ${_passwordController.text.trim()}");

    _authController.login(
      _emailController.text.trim(),
      _passwordController.text.trim(),
    );
  }

  void _loginPhone() {
    Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) => const LoginPhone()),
    );
  }

  void _navigateToRegister() {
    Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) => const RegisterEmail()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: "Login with email"),
      body: Obx(() {
        if (_authController.isLoading.value) {
          return const LoadingScreen();
        } else if (_authController.isLoggedIn.value) {
          // return const LayoutPage();
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Get.offAll(() => const LayoutPage());
          });
          return const SizedBox.shrink();
        } else {
          return LoginBody(
            obscureText: _obscureText,
            onToggleObscureText: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            onSignIn: _signIn,
            emailController: _emailController,
            passwordController: _passwordController,
          );
        }
      }),
      bottomNavigationBar: LoginBottomAppBar(
        onLoginPhone: _loginPhone,
        onTherapistSignUp: () {
          Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => const BecomeTherapistPage1()),
          );
        },
        onRegister: _navigateToRegister,
      ),
    );
  }
}

class RegisterEmail extends StatefulWidget {
  const RegisterEmail({super.key});

  @override
  RegisterEmailState createState() => RegisterEmailState();
}

class RegisterEmailState extends State<RegisterEmail> {
  bool _obscureText = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthController _authController = Get.find<AuthController>();

  void _register() {
    _authController.register(
      _emailController.text.trim(),
      _passwordController.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: "Register with email"),
      body: Obx(() {
        if (_authController.isLoading.value) {
          return const LoadingScreen();
        } else if (_authController.isLoggedIn.value) {
          return const LayoutPage();
        } else {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 20),
                EmailField(controller: _emailController),
                const SizedBox(height: 16),
                PasswordField(
                  obscureText: _obscureText,
                  onToggleObscureText: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  controller: _passwordController,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _register,
                  child: const Text("Register"),
                ),
              ],
            ),
          );
        }
      }),
    );
  }
}

class LoginBody extends StatelessWidget {
  final bool obscureText;
  final VoidCallback onToggleObscureText;
  final VoidCallback onSignIn;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginBody({
    super.key,
    required this.obscureText,
    required this.onToggleObscureText,
    required this.onSignIn,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 20),
          EmailField(controller: emailController),
          const SizedBox(height: 16),
          PasswordField(
            obscureText: obscureText,
            onToggleObscureText: onToggleObscureText,
            controller: passwordController,
          ),
          const SizedBox(height: 10),
          const ForgotPasswordButton(),
          const SizedBox(height: 20),
          SignInButton(onSignIn: onSignIn),
        ],
      ),
    );
  }
}




// import 'package:capstone_project_mobile/layouts/my_app_bar.dart';
// import 'package:capstone_project_mobile/pages/login/widgets/email_field.dart';
// import 'package:capstone_project_mobile/pages/login/widgets/forget_password.dart';
// import 'package:capstone_project_mobile/pages/login/widgets/login_bottom_appbar.dart';
// import 'package:capstone_project_mobile/pages/login/widgets/password_field.dart';
// import 'package:capstone_project_mobile/pages/login/widgets/sign_in_button.dart';
// import 'package:capstone_project_mobile/pages/therapist_sign_up/input_information_page.dart';
// import 'package:capstone_project_mobile/pages/layout_page.dart';
// import 'package:capstone_project_mobile/pages/login/login_phone_page.dart';
// import 'package:capstone_project_mobile/shared/loading_screen.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class LoginEmail extends StatefulWidget {
//   const LoginEmail({super.key});

//   @override
//   LoginEmailState createState() => LoginEmailState();
// }

// class LoginEmailState extends State<LoginEmail> {
//   bool _obscureText = true;
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   void _signIn() async {
//     // Print the email and password
//     print('Email: ${_emailController.text}');
//     print('Password: ${_passwordController.text}');

//     Navigator.push(
//       context,
//       CupertinoPageRoute(builder: (context) => const LoadingScreen()),
//     );

//     await Future.delayed(const Duration(seconds: 1), () {
//       Navigator.pushReplacement(
//         context,
//         CupertinoPageRoute(builder: (context) => const LayoutPage()),
//       );
//     });
//   }

//   void _loginPhone() {
//     Navigator.push(
//       context,
//       CupertinoPageRoute(builder: (context) => const LoginPhone()),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const MyAppBar(title: "Login with email"),
//       body: LoginBody(
//         obscureText: _obscureText,
//         onToggleObscureText: () {
//           setState(() {
//             _obscureText = !_obscureText;
//           });
//         },
//         onSignIn: _signIn,
//         emailController: _emailController,
//         passwordController: _passwordController,
//       ),
//       bottomNavigationBar: LoginBottomAppBar(
//         onLoginPhone: _loginPhone,
//         onTherapistSignUp: () {
//           Navigator.push(
//             context,
//             CupertinoPageRoute(builder: (context) => BecomeTherapistPage1()),
//           );
//         },
//       ),
//     );
//   }
// }

// class LoginBody extends StatelessWidget {
//   final bool obscureText;
//   final VoidCallback onToggleObscureText;
//   final VoidCallback onSignIn;
//   final TextEditingController emailController;
//   final TextEditingController passwordController;

//   const LoginBody({
//     super.key,
//     required this.obscureText,
//     required this.onToggleObscureText,
//     required this.onSignIn,
//     required this.emailController,
//     required this.passwordController,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(20.0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           const SizedBox(height: 20),
//           EmailField(controller: emailController),
//           const SizedBox(height: 16),
//           PasswordField(
//             obscureText: obscureText,
//             onToggleObscureText: onToggleObscureText,
//             controller: passwordController,
//           ),
//           const SizedBox(height: 10),
//           const ForgotPasswordButton(),
//           const SizedBox(height: 20),
//           SignInButton(onSignIn: onSignIn),
//         ],
//       ),
//     );
//   }
// }










// import 'package:capstone_project_mobile/layouts/my_app_bar.dart';
// import 'package:capstone_project_mobile/pages/therapist_sign_up/input_information_page.dart';
// import 'package:capstone_project_mobile/pages/layout_page.dart';
// import 'package:capstone_project_mobile/pages/login/login_phone_page.dart';
// import 'package:capstone_project_mobile/shared/loading_screen.dart';
// import 'package:capstone_project_mobile/theme/base_app_colors.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class LoginEmail extends StatefulWidget {
//   const LoginEmail({super.key});

//   @override
//   LoginEmailState createState() => LoginEmailState();
// }

// class LoginEmailState extends State<LoginEmail> {
//   bool _obscureText = true;

//   void _signIn() async {
//     Navigator.push(
//       context,
//       CupertinoPageRoute(builder: (context) => const LoadingScreen()),
//     );

//     await Future.delayed(const Duration(seconds: 1), () {
//       Navigator.pushReplacement(
//         context,
//         CupertinoPageRoute(builder: (context) => const LayoutPage()),
//       );
//     });
//   }

//   void _loginPhone() {
//     Navigator.push(
//       context,
//       CupertinoPageRoute(builder: (context) => const LoginPhone()),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const MyAppBar(title: "Login with email"),
//       body: _buildBody(context),
//       bottomNavigationBar: _buildBottomAppBar(context),
//     );
//   }

//   Widget _buildBody(BuildContext context) {
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(20.0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           const SizedBox(height: 20),
//           TextField(
//             decoration: InputDecoration(
//               labelText: 'Email / Username',
//               labelStyle: const TextStyle(
//                 color: Colors.grey, // Label color
//                 fontSize: 16,
//               ),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(8.0),
//               ),
//             ),
//           ),
//           const SizedBox(height: 16),
//           TextField(
//             obscureText: _obscureText,
//             decoration: InputDecoration(
//               labelText: 'Password',
//               labelStyle: const TextStyle(
//                 color: Colors.grey, // Label color
//                 fontSize: 16,
//               ),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(8.0),
//               ),
//               suffixIcon: IconButton(
//                 icon: Icon(
//                   _obscureText ? Icons.visibility : Icons.visibility_off,
//                 ),
//                 onPressed: () {
//                   setState(() {
//                     _obscureText = !_obscureText;
//                   });
//                 },
//               ),
//             ),
//           ),
//           const SizedBox(height: 10),
//           Align(
//             alignment: Alignment.center,
//             child: TextButton(
//               onPressed: () {
//                 // Handle forgot password
//               },
//               child: const Text(
//                 'Forget Password?',
//                 style: TextStyle(fontSize: 16),
//               ),
//             ),
//           ),
//           const SizedBox(height: 20),
//           ElevatedButton(
//             onPressed: () {
//               _signIn();
//             },
//             style: ElevatedButton.styleFrom(
//               minimumSize:
//                   const Size(double.infinity, 50), // Button width and height
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(25),
//               ),
//               backgroundColor: BaseAppColors.primaryColor,
//             ),
//             child: const Text('Sign In',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 20.0,
//                 )),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildBottomAppBar(BuildContext context) {
//     return SizedBox(
//       height: 280, // Set the desired height for the BottomAppBar
//       child: BottomAppBar(
//         shape: const CircularNotchedRectangle(),
//         color: Colors.white,
//         elevation: 0,
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Text(
//                 "Sign in with",
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 20,
//                 ),
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton.icon(
//                 onPressed: () {
//                   // Handle sign in with phone
//                   _loginPhone();
//                 },
//                 icon: const Icon(Icons.phone),
//                 label: const Text(
//                   'Phone',
//                   style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 20.0,
//                       fontWeight: FontWeight.w400),
//                 ),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color.fromRGBO(240, 240, 240, 1),
//                   minimumSize: const Size(
//                       double.infinity, 50), // Button width and height
//                   // primary: Colors.white,
//                   // onPrimary: Colors.black,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8.0),
//                     side: const BorderSide(color: Colors.transparent),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton.icon(
//                 onPressed: () {
//                   // Handle sign in with Google
//                 },
//                 icon: Image.asset(
//                   'lib/assets/icons/google.png', // Ensure you have a Google icon in your assets
//                   height: 25,
//                   width: 25,
//                 ),
//                 label: const Text(
//                   'Google',
//                   style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 20.0,
//                       fontWeight: FontWeight.w400),
//                 ),
//                 style: ElevatedButton.styleFrom(
//                   minimumSize: const Size(
//                       double.infinity, 50), // Button width and height
//                   // primary: Colors.white,
//                   // onPrimary: Colors.black,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8.0),
//                     side: const BorderSide(color: Colors.transparent),
//                   ),
//                   backgroundColor: const Color.fromRGBO(240, 240, 240, 1),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   const Text("Don’t have an account? "),
//                   GestureDetector(
//                     onTap: () {
//                       // Handle sign up
//                     },
//                     child: const Text(
//                       'Sign Up',
//                       style: TextStyle(
//                         color: Colors.blue,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 10),
//               GestureDetector(
//                 onTap: () {
//                   // Handle therapist sign up
//                   Navigator.push(
//                     context,
//                     CupertinoPageRoute(
//                         builder: (context) => BecomeTherapistPage1()),
//                   );
//                 },
//                 child: const Text(
//                   'Become A Therapist',
//                   style: TextStyle(
//                     color: Colors.blue,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
