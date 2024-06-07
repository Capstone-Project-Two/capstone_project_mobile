import 'package:flutter/material.dart';

class ErrorDialog extends StatelessWidget {
  final String text;
  const ErrorDialog({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.red,
      content: SizedBox(
        width: 120,
        height: 120,
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              overflow: TextOverflow.visible,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
