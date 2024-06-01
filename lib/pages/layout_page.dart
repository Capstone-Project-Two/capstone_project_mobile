// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:capstone_project_mobile/pages/forum_page.dart';
import 'package:capstone_project_mobile/pages/home_page.dart';
import 'package:capstone_project_mobile/pages/profile_page.dart';
import 'package:capstone_project_mobile/pages/resource_page.dart';
import 'package:capstone_project_mobile/pages/thgerapists_page.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class LayoutPage extends StatefulWidget {
  LayoutPage({super.key});

  @override
  State<LayoutPage> createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  int _selectedIndex = 0;

  List pages = [
    HomePage(),
    ForumPage(),
    TherapistsPage(),
    ResourcePage(),
    ProfilePage(),
  ];

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: pages[_selectedIndex],
      bottomNavigationBar: _buildBottomNavigationBar(
        context: context,
        selectedIndex: _selectedIndex,
        navigateBottomBar: _navigateBottomBar,
      ),
    );
  }
}

AppBar _buildAppBar(BuildContext context) {
  return AppBar(
    title: Text('App bar'),
  );
}

BottomNavigationBar _buildBottomNavigationBar({
  required BuildContext context,
  required int selectedIndex,
  required Function(int) navigateBottomBar,
}) {
  return BottomNavigationBar(
    onTap: navigateBottomBar,
    currentIndex: selectedIndex,
    type: BottomNavigationBarType.fixed,
    selectedLabelStyle: TextStyle(
      color: Colors.white,
    ),
    items: [
      BottomNavigationBarItem(
        icon: Icon(LucideIcons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(LucideIcons.heartHandshake),
        label: 'Forum',
      ),
      BottomNavigationBarItem(
        icon: Icon(LucideIcons.book),
        label: 'Therapists',
      ),
      BottomNavigationBarItem(
        icon: Icon(LucideIcons.library),
        label: 'Resource',
      ),
      BottomNavigationBarItem(
        icon: Icon(LucideIcons.user),
        label: 'Profile',
      ),
    ],
  );
}
