import 'package:capstone_project_mobile/pages/layout_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      color: colorScheme.surface,
      padding: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Success',
            style: textTheme.displayLarge!.copyWith(
              fontSize: 40,
              color: colorScheme.tertiary,
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
                colorScheme.primary,
              ),
            ),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                CupertinoPageRoute(
                  builder: (context) => const LayoutPage(),
                ),
              );
            },
            child: Text(
              'Go to forum page',
              style: textTheme.displayMedium!.copyWith(
                color: colorScheme.inversePrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
