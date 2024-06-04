import 'package:flutter/material.dart';
import '../../constants/env_constants.dart';

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
