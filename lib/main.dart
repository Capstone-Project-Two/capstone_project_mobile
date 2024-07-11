import 'package:capstone_project_mobile/pages/layout_page.dart';
import 'package:capstone_project_mobile/providers/appointment_provider.dart';
import 'package:capstone_project_mobile/providers/post_provider.dart';
import 'package:capstone_project_mobile/providers/therapist_provider.dart';
import 'package:capstone_project_mobile/routes/app_route.dart';
import 'package:capstone_project_mobile/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

Future main() async {
  await dotenv.load(fileName: '.env');
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => PostProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => TherapistProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => AppointmentProvider(),
      ),
      // Other providers
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Capstone Project',
      routes: AppRoute.routes,
      theme: appTheme,
      home: const LayoutPage(),
    );
  }
}
