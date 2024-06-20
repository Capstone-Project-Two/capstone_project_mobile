import 'package:capstone_project_mobile/constants/route_constants.dart';
import 'package:capstone_project_mobile/pages/forum/forum_page.dart';
import 'package:capstone_project_mobile/pages/home/home_page.dart';
import 'package:capstone_project_mobile/pages/profile/profile_page.dart';
import 'package:capstone_project_mobile/pages/resource/resource_page.dart';
import 'package:capstone_project_mobile/pages/therapists/therapists_page.dart';

class AppRoute {
  static final appPages = [
    const HomePage(),
    const ForumPage(),
    const TherapistsPage(),
    const ResourcePage(),
    const ProfilePage(),
  ];

  static final appTitle = [
    'Home',
    'Forum',
    'Therapists',
    'Resources',
    'Profile',
  ];

  static final routes = {
    RouteConstant.homePage.name: (context) => const HomePage(),
    RouteConstant.forumPage.name: (context) => const ForumPage(),
    RouteConstant.therapistsPage.name: (context) => const TherapistsPage(),
    RouteConstant.resourcePage.name: (context) => const ResourcePage(),
    RouteConstant.profilePage.name: (context) => const ProfilePage(),
  };
}
