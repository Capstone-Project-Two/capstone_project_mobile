import 'package:capstone_project_mobile/pages/login/login_email_page.dart';
import 'package:capstone_project_mobile/theme/base_app_colors.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool actionsEnabled;

  const MyAppBar(
      {super.key, required this.title, required this.actionsEnabled});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return PreferredSize(
      preferredSize:
          const Size.fromHeight(70.0), // Set the height of the AppBar
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(20.0), // Adjust the radius as needed
        ),
        child: AppBar(
          actions: actionsEnabled
              ? [
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginEmail()));
                      },
                      icon: const Icon(Icons.login))
                ]
              : null,
          // automaticallyImplyLeading: false,
          backgroundColor: colorScheme.primary,
          title: Padding(
            padding: const EdgeInsets.only(
                top: 10.0, left: 10.0), // Adjust as needed
            child: Text(
              title,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: 22,
                fontFamily: 'Kantumruy Pro', // Specify your font family
                fontWeight: FontWeight.w700, // Use FontWeight.w700 for bold
              ),
            ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: BaseAppColors.appGradient,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 70);
}
