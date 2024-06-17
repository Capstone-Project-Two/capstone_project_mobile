import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ErrorScreen extends StatelessWidget {
  final void Function()? onTryAgain;
  final int? statusCode;
  const ErrorScreen({
    super.key,
    required this.onTryAgain,
    this.statusCode = 500,
  });

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    TextTheme textTheme = Theme.of(context).textTheme;
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Something went wrong",
            style: textTheme.displayLarge!.copyWith(
              color: colorScheme.primary,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            statusCode.toString(),
            style: textTheme.displayMedium!.copyWith(
              color: Colors.red,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(colorScheme.primary),
                foregroundColor:
                    MaterialStatePropertyAll(colorScheme.background),
              ),
              onPressed: onTryAgain,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(LucideIcons.iterationCw),
                  SizedBox(
                    width: 4,
                  ),
                  Text('Try again'),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
