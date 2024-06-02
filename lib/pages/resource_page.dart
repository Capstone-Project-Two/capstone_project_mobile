import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';


@RoutePage(name: 'ResourcePage')
class ResourcePage extends StatelessWidget {
  const ResourcePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Resource Page'),
      ),
    );
  }
}

