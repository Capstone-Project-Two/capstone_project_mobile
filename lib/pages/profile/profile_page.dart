import 'package:capstone_project_mobile/pages/profile/coins_payment_page.dart';
import 'package:capstone_project_mobile/pages/profile/your_activity.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              _buildProfileCard(context),
              _build2Button(context),
              const SizedBox(
                height: 20,
              ),
              _buildEdited(context),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileCard(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(colorScheme.secondary.red,
                  colorScheme.secondary.green, colorScheme.secondary.blue, 0.3),
              Color.fromRGBO(colorScheme.primary.red, colorScheme.primary.green,
                  colorScheme.primary.blue, 0.3),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: SizedBox(
          width: double.infinity,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width / 4,
                    child: Container(
                      width: 100,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.12),
                            spreadRadius: 4,
                            blurRadius: 4,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          'lib/assets/images/profile.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    )),
                const Spacer(),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Alixz',
                          style: TextStyle(
                              color: Color.fromRGBO(0, 47, 110, 1),
                              fontSize: 32,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          height: 2.0,
                          color: Color.fromRGBO(0, 47, 110, 1),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Your Coins: 45',
                          style: TextStyle(
                              color: Color.fromRGBO(0, 47, 110, 1),
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _build2Button(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [colorScheme.primary, colorScheme.secondary],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 2.4,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CoinsPaymentPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  foregroundColor: colorScheme.onPrimary,
                  elevation: 10,
                  textStyle: const TextStyle(fontSize: 25),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 20,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 10,
                      child: const Icon(
                        LucideIcons.circleDollarSign,
                        weight: 24,
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 5,
                      child: const Text(
                        'Coins and Payment',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [colorScheme.primary, colorScheme.secondary],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 2.4,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => YourActivity()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  foregroundColor: colorScheme.onPrimary,
                  elevation: 10,
                  textStyle: const TextStyle(fontSize: 25),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 20,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 10,
                      child: const Icon(
                        LucideIcons.alignJustify,
                        weight: 24,
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 5,
                      child: const Text(
                        'Your Activitys',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEdited(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      child: Column(
        children: [
          //username
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: colorScheme.surface,
              border: const Border(
                top: BorderSide(
                  color: Color.fromRGBO(217, 217, 217, 1),
                  width: 1.0,
                ),
                bottom: BorderSide(
                  color: Color.fromRGBO(217, 217, 217, 1),
                  width: 1.0,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.15,
                    child: Icon(
                      LucideIcons.user,
                      size: 24,
                      color: colorScheme.primary,
                    ),
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Username',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Alixz',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      )),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.15,
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => const CoinsPaymentPage()),
                        // );
                      },
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: colorScheme.surface,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.only(left: 3)),
                      child: const Icon(
                        LucideIcons.pencil,
                        color: Colors.black,
                        size: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //email
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: colorScheme.surface,
              border: const Border(
                bottom: BorderSide(
                  color: Color.fromRGBO(217, 217, 217, 1),
                  width: 1.0,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.15,
                    child: Icon(
                      LucideIcons.mail,
                      size: 24,
                      color: colorScheme.primary,
                    ),
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Email',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Liza123@gmail.com',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      )),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.15,
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => const CoinsPaymentPage()),
                        // );
                      },
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: colorScheme.surface,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.only(left: 3)),
                      child: const Icon(
                        LucideIcons.pencil,
                        color: Colors.black,
                        size: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //password
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: colorScheme.surface,
              border: const Border(
                bottom: BorderSide(
                  color: Color.fromRGBO(217, 217, 217, 1),
                  width: 1.0,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.15,
                    child: Icon(
                      LucideIcons.lock,
                      size: 24,
                      color: colorScheme.primary,
                    ),
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Password',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '**********',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      )),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.15,
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => const CoinsPaymentPage()),
                        // );
                      },
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: colorScheme.surface,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.only(left: 3)),
                      child: const Icon(
                        LucideIcons.pencil,
                        color: Colors.black,
                        size: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
// logout
          ElevatedButton(
            onPressed: () {
              // Your onPressed function here
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: colorScheme.surface,
                padding: EdgeInsets.zero, // Remove default padding
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      0), // Customize the border radius if needed
                ),
                elevation: 0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.15,
                    child: Icon(
                      LucideIcons.logOut,
                      size: 24,
                      color: colorScheme.primary,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        'Log out',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
