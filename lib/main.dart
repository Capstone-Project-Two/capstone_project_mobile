// // import 'package:capstone_project_mobile/constants/route_constants.dart';
// // import 'package:capstone_project_mobile/pages/forum_page.dart';
// // import 'package:capstone_project_mobile/pages/home_page.dart';
// // import 'package:capstone_project_mobile/pages/layout_page.dart';
// // import 'package:capstone_project_mobile/pages/profile_page.dart';
// // import 'package:capstone_project_mobile/pages/resource_page.dart';
// // import 'package:capstone_project_mobile/pages/thgerapists_page.dart';
// import 'package:capstone_project_mobile/route/app_router.dart';
import 'package:capstone_project_mobile/theme/app_theme.dart';
// import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

// Future main() async {
//   await dotenv.load(fileName: '.env');
//   final appRouter = AppRouter();
//   runApp( MyApp(appRouter: appRouter));
// }

// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       title: 'Capstone Project',
// //       routes: {
// //         RouteConstant.homePage.name: (context) => const HomePage(),
// //         RouteConstant.forumPage.name: (context) => const ForumPage(),
// //         RouteConstant.therapistsPage.name: (context) => const TherapistsPage(),
// //         RouteConstant.resourcePage.name: (context) => const ResourcePage(),
// //         RouteConstant.profilePage.name: (context) => const ProfilePage(),
// //       },
// //       theme: appTheme,
// //       home: const LayoutPage(),
// //     );
// //   }
// // }

// class MyApp extends StatelessWidget {
//   // MyApp({super.key});

//  final AppRouter appRouter;

//   MyApp({required this.appRouter});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       debugShowCheckedModeBanner: false,
//       title: 'Capstone Project',
//       theme: appTheme,
//       routerDelegate: appRouter.delegate(),
//       routeInformationParser: appRouter.defaultRouteParser(),
//     );
//   }
// }
import 'package:capstone_project_mobile/route/app_router.dart';
import 'package:flutter/material.dart';
// import 'package:auto_route/auto_route.dart';
// import 'package:capstone_project_mobile/route/app_router.gr.dart';


Future main() async {
  await dotenv.load(fileName: '.env');
  final appRouter = AppRouter();
  runApp( MyApp(appRouter: appRouter));
}


// class MyApp extends StatelessWidget {
//   final AppRouter appRouter;

//   MyApp({required this.appRouter});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       routerDelegate: appRouter.delegate(),
//       routeInformationParser: appRouter.defaultRouteParser(),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  MyApp({required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Capstone Project',
      theme: appTheme,
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
      debugShowCheckedModeBanner: false,
    );
  }
}