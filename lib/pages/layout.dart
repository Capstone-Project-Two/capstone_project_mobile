// import 'package:auto_route/auto_route.dart';
// import 'package:capstone_project_mobile/layouts/my_bottom_navigation_bar.dart';
// import 'package:capstone_project_mobile/route/app_router.dart';
// import 'package:flutter/material.dart';

// class LayoutPage extends StatefulWidget {

//   const LayoutPage({Key? key}) : super(key: key);

//   @override
//   _LayoutPageState createState() => _LayoutPageState();
// }

// class _LayoutPageState extends State<LayoutPage> {
//   int _selectedIndex = 0;

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ExtendedNavigato(
//         router: AppRouter(),
//         initialRoute: AppR.home,
//       ),
//       bottomNavigationBar: MyBottomNavigationBar(
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }
