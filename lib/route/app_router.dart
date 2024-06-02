// import 'app_router.gr.dart';
// import 'package:auto_route/auto_route.dart';

// @AutoRouterConfig(replaceInRouteName: 'Screen,Route')
// class AppRouter extends $AppRouter {
//   @override
//   List<AutoRoute> get routes => [
//         // AutoRoute(page: LayoutPage.page, initial: true),
//         // AutoRoute(page: ProfilePage.page),
//         //     AutoRoute(page: ProfilePage.page),

//         CustomRoute(
//           page: LayoutPage.page,
//           initial: true,
//           transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
//           durationInMilliseconds: 200,
//         ),
//         CustomRoute(
//           page: Profile.page,
//           transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
//           durationInMilliseconds: 200,
//         ),
//         CustomRoute(
//           page: HomePage.page,
//           transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
//           durationInMilliseconds: 200,
//         ),
//         CustomRoute(
//           page: ForumPage.page,
//           transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
//           durationInMilliseconds: 200,
//         ),
//         CustomRoute(
//           page: ResourcePage.page,
//           transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
//           durationInMilliseconds: 200,
//         ),
//         CustomRoute(
//           page: TherapistsPage.page,
//           transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
//           durationInMilliseconds: 200,
//         ),
//       ];
// }

// import 'package:auto_route/auto_route.dart';
// // import 'package:capstone_project_mobile/pages/home_page.dart';
// // import 'package:capstone_project_mobile/pages/forum_page.dart';
// // import 'package:capstone_project_mobile/pages/therapists_page.dart';
// // import 'package:capstone_project_mobile/pages/resource_page.dart';
// // import 'package:capstone_project_mobile/pages/profile_page.dart';
// // import 'package:capstone_project_mobile/pages/layout_page.dart';
// import 'package:capstone_project_mobile/route/app_router.gr.dart';

// @AutoRouterConfig(replaceInRouteName: 'Screen,Route')
// class AppRouter extends $AppRouter {
//   @override
//   List<AutoRoute> get routes => [
//         AutoRoute(page: LayoutPage.page, initial: true, children: [
//           AutoRoute(page: HomePage.page, initial: true),
//           AutoRoute(page: ForumPage.page),
//           AutoRoute(page: TherapistsPage.page),
//           AutoRoute(page: ResourcePage.page),
//           AutoRoute(page: Profile.page),
//         ]),
//       ];
// }


import 'package:auto_route/auto_route.dart';
// import 'package:capstone_project_mobile/pages/home_page.dart';
// import 'package:capstone_project_mobile/pages/forum_page.dart';
// import 'package:capstone_project_mobile/pages/therapists_page.dart';
// import 'package:capstone_project_mobile/pages/resource_page.dart';
// import 'package:capstone_project_mobile/pages/profile_page.dart';
// import 'package:capstone_project_mobile/pages/layout_page.dart';
import 'package:capstone_project_mobile/route/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LayoutPage.page, initial: true, children: [
          AutoRoute(page: HomePage.page, initial: true),
          AutoRoute(page: ForumPage.page),
          AutoRoute(page: TherapistsPage.page),
          AutoRoute(page: ResourcePage.page),
          AutoRoute(page: Profile.page),
        ]),
      ];
}
