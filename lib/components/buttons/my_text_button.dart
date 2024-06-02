import 'package:flutter/material.dart';

class MyTextButton extends StatelessWidget {
  final String text;
  final IconData iconData;
  final void Function()? onTap;

  const MyTextButton({
    super.key,
    required this.text,
    required this.iconData,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return TextButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(
              color: Colors.grey.shade400,
            ),
          ),
        ),
      ),
      onPressed: () {},
      child: Row(
        children: [
          Icon(
            iconData,
            color: colorScheme.tertiary,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            text,
            style: TextStyle(color: colorScheme.tertiary),
          ),
        ],
      ),
    );
  }
}
