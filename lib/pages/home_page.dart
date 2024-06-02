import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../constants/env_constants.dart';

@RoutePage(name: 'HomePage')
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Home Page: $appName'),
      ),
    );
  }
}
