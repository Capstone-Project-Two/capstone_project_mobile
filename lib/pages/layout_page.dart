import 'package:capstone_project_mobile/layouts/my_app_bar.dart';
import 'package:capstone_project_mobile/layouts/my_bottom_navigation_bar.dart';
import 'package:capstone_project_mobile/routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LayoutPage extends StatefulWidget {
  const LayoutPage({super.key, this.selectedIndex = 0});

  final int? selectedIndex;

  @override
  State<LayoutPage> createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  int? _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

<<<<<<< Updated upstream
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

=======
>>>>>>> Stashed changes
  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: AppRoute.appTitle[_selectedIndex!],
        actionsEnabled: true,
      ),
      body: FutureBuilder(
        future: rootBundle.loadString('.env'),
        initialData: '',
<<<<<<< Updated upstream
        builder: (context, snapshot) => pages[_selectedIndex!],
=======
        builder: (context, snapshot) => IndexedStack(
          index: _selectedIndex,
          children: AppRoute.appPages,
        ),
>>>>>>> Stashed changes
      ),
      bottomNavigationBar: MyBottomNavigationBar(
        selectedIndex: _selectedIndex!,
        navigateBottomBar: _navigateBottomBar,
      ),
    );
  }
}
