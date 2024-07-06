import 'package:flutter/material.dart';

class EmptyScreen extends StatelessWidget {
  final String? title;

  const EmptyScreen({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(title ?? 'Empty Data'),
    );
  }
}
