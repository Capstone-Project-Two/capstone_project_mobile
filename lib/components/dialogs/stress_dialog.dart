import 'package:capstone_project_mobile/pages/home/stress_monitor_page/start_stress_monitor.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class StressDialog extends StatelessWidget {
  const StressDialog({super.key});
  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    final ButtonStyle textButtonStyle = TextButton.styleFrom(
      backgroundColor: colorScheme.primary,
      elevation: 3,
      shadowColor: Colors.grey[500],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
    );
    return AlertDialog(
      scrollable: true,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      actions: [
        Row(
          children: [
            Expanded(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StartMonitorPage(),
                    ),
                  );
                },
                style: textButtonStyle,
                child: const Text('Yes',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16)),
              ),
            ),
          ],
        ),
      ],
      actionsAlignment: MainAxisAlignment.center,
      actionsPadding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
      content: const SizedBox(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                LucideIcons.heartHandshake,
                size: 50,
                color: Colors.red,
              ),
              SizedBox(height: 12),
              Text(
                'We detect that you might be stressed.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    height: 1.5,
                    overflow: TextOverflow.visible,
                    color: Colors.red,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              Text(
                'Would you like to monitor your stress levels?',
                textAlign: TextAlign.center,
                style: TextStyle(
                    height: 1.5,
                    overflow: TextOverflow.visible,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
