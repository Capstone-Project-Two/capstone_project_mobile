import 'package:auto_route/auto_route.dart';
import 'package:capstone_project_mobile/layouts/my_bottom_navigation_bar.dart';
import 'package:capstone_project_mobile/pages/forum_page.dart';
import 'package:capstone_project_mobile/pages/home_page.dart';
import 'package:capstone_project_mobile/pages/profile_page.dart';
import 'package:capstone_project_mobile/pages/resource_page.dart';
import 'package:capstone_project_mobile/pages/therapists_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

@RoutePage(name: 'LayoutPage')
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
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(200.0), // Set the height of the AppBar
      //   child: ClipRRect(
      //     borderRadius: BorderRadius.vertical(
      //       bottom: Radius.circular(20.0), // Adjust the radius as needed
      //     ),
      //     child: _buildAppBar(context, titles[_selectedIndex]),
      //   ),
      // ),

      appBar: _buildPreferredSize(context, titles[_selectedIndex]),

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

// AppBar _buildAppBar(BuildContext context, String title) {
//   ColorScheme colorScheme = Theme.of(context).colorScheme;
//   return AppBar(
//     // prefer: Size.fromHeight(200.0), // Set the height of the AppBar

//     backgroundColor: colorScheme.primary,

//     title: Text(
//       title,
//       style: TextStyle(
//         color: Theme.of(context).colorScheme.onPrimary,
//         fontSize: 22,
//         fontWeight: FontWeight.bold,
//       ),
//     ),
//     flexibleSpace: Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: [
//             colorScheme.primary,
//             colorScheme.secondary,
//           ],
//         ),
//       ),
//     ),
//   );
// }
PreferredSize _buildPreferredSize(BuildContext context, String title) {
  ColorScheme colorScheme = Theme.of(context).colorScheme;

  return PreferredSize(
    preferredSize: Size.fromHeight(70.0), // Set the height of the AppBar
    child: ClipRRect(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(20.0), // Adjust the radius as needed
      ),
      child: AppBar(
        backgroundColor: colorScheme.primary,
        title: Padding(
          padding:
              const EdgeInsets.only(top: 10.0, left: 10.0), // Adjust as needed
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
            gradient: LinearGradient(
              colors: [
                colorScheme.primary,
                colorScheme.secondary,
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
