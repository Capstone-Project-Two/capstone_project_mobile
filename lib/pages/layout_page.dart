import 'package:capstone_project_mobile/pages/forum_page.dart';
import 'package:capstone_project_mobile/pages/home_page.dart';
import 'package:capstone_project_mobile/pages/profile_page.dart';
import 'package:capstone_project_mobile/pages/resource_page.dart';
import 'package:capstone_project_mobile/pages/thgerapists_page.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

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
    title: const Text('App bar'),
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
    selectedLabelStyle: const TextStyle(
      color: Colors.white,
    ),
    items: const [
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
