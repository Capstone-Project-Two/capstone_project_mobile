import 'package:capstone_project_mobile/constants/route_constants.dart';
import 'package:capstone_project_mobile/pages/forum/forum_page.dart';
import 'package:capstone_project_mobile/pages/home/home_page.dart';
import 'package:capstone_project_mobile/pages/layout_page.dart';
import 'package:capstone_project_mobile/pages/profile/profile_page.dart';
import 'package:capstone_project_mobile/pages/resource/resource_page.dart';
import 'package:capstone_project_mobile/pages/therapists/thgerapists_page.dart';
import 'package:capstone_project_mobile/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  await dotenv.load(fileName: '.env');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Capstone Project',
      routes: {
        RouteConstant.homePage.name: (context) => const HomePage(),
        RouteConstant.forumPage.name: (context) => const ForumPage(),
        RouteConstant.therapistsPage.name: (context) => const TherapistsPage(),
        RouteConstant.resourcePage.name: (context) => const ResourcePage(),
        RouteConstant.profilePage.name: (context) => const ProfilePage(),
      },
      theme: appTheme,
      home: const LayoutPage(),
    );
  }
}
