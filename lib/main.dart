import 'package:capstone_project_mobile/constants/route_constants.dart';
import 'package:capstone_project_mobile/pages/forum_page.dart';
import 'package:capstone_project_mobile/pages/home_page.dart';
import 'package:capstone_project_mobile/pages/layout_page.dart';
import 'package:capstone_project_mobile/pages/profile_page.dart';
import 'package:capstone_project_mobile/pages/resource_page.dart';
import 'package:capstone_project_mobile/pages/thgerapists_page.dart';
import 'package:flutter/material.dart';

void main() {
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
        ROUTE_CONSTANTS.homePage.toString(): (context) => HomePage(),
        ROUTE_CONSTANTS.forumPage.toString(): (context) => ForumPage(),
        ROUTE_CONSTANTS.therapistsPage.toString(): (context) => HomePage(),
        ROUTE_CONSTANTS.homePage.toString(): (context) => TherapistsPage(),
        ROUTE_CONSTANTS.resourcePage.toString(): (context) => ResourcePage(),
        ROUTE_CONSTANTS.profilePage.toString(): (context) => ProfilePage(),
      },
      theme: ThemeData(
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color(0xFF005EDC),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          unselectedIconTheme: IconThemeData(
            color: Colors.white,
          ),
          selectedIconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF005EDC),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF005EDC),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      home: LayoutPage(),
    );
  }
}
