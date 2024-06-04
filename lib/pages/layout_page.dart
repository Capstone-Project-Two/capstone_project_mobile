import 'package:capstone_project_mobile/layouts/my_app_bar.dart';
import 'package:capstone_project_mobile/layouts/my_bottom_navigation_bar.dart';
import 'package:capstone_project_mobile/pages/forum_page.dart';
import 'package:capstone_project_mobile/pages/home_page.dart';
import 'package:capstone_project_mobile/pages/profile_page.dart';
import 'package:capstone_project_mobile/pages/resource_page.dart';
import 'package:capstone_project_mobile/pages/therapists/therapists_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LayoutPage extends StatefulWidget {
  const LayoutPage({super.key});

  @override
  State<LayoutPage> createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  int _selectedIndex = 0;

  List pages = [
    const HomePage(),
    const ForumPage(),
    const TherapistsPage(),
    const ResourcePage(),
    const ProfilePage(),
  ];

  List<String> titles = [
    'Home',
    'Forum',
    'Therapists',
    'Resources',
    'Profile',
  ];

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: titles[_selectedIndex],
        actionsEnabled: true,
      ),
      body: FutureBuilder(
        future: rootBundle.loadString('.env'),
        initialData: '',
        builder: (context, snapshot) => pages[_selectedIndex],
      ),
      bottomNavigationBar: MyBottomNavigationBar(
        selectedIndex: _selectedIndex,
        navigateBottomBar: _navigateBottomBar,
      ),
    );
  }
}
