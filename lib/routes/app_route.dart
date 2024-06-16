import 'package:capstone_project_mobile/constants/route_constants.dart';
import 'package:capstone_project_mobile/pages/comment/comment_page.dart';
import 'package:capstone_project_mobile/pages/forum/forum_page.dart';
import 'package:capstone_project_mobile/pages/home/home_page.dart';
import 'package:capstone_project_mobile/pages/profile/profile_page.dart';
import 'package:capstone_project_mobile/pages/resource/resource_page.dart';
import 'package:capstone_project_mobile/pages/therapists/therapists_page.dart';
import 'package:flutter/material.dart';

class AppRoute {
  static final appPages = [
    const HomePage(),
    const ForumPage(),
    const TherapistsPage(),
    const ResourcePage(),
    const ProfilePage(),
    const CommentPage(),
  ];

  static final appTitle = [
    'Home',
    'Forum',
    'Therapists',
    'Resources',
    'Profile',
    'Comment',
  ];

  static final Map<String, Widget Function(BuildContext)> routes = {
    RouteConstant.homePage.name: (context) => const HomePage(),
    RouteConstant.forumPage.name: (context) => const ForumPage(),
    RouteConstant.therapistsPage.name: (context) => const TherapistsPage(),
    RouteConstant.resourcePage.name: (context) => const ResourcePage(),
    RouteConstant.profilePage.name: (context) => const ProfilePage(),
    RouteConstant.commentPage.name: (context) => const CommentPage(),
  };
}
