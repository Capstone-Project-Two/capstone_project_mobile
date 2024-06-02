import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';

@RoutePage(name: 'Profile')

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Profile Page'),
      ),
    );
  }
}
