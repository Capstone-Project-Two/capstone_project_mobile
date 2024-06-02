import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage(name: 'TherapistsPage')
// @RoutePage()

class TherapistsPage extends StatelessWidget {
  const TherapistsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Therapists Page'),
      ),
    );
  }
}
