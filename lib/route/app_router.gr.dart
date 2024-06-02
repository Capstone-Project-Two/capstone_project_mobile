// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:capstone_project_mobile/pages/forum_page.dart' as _i1;
import 'package:capstone_project_mobile/pages/home_page.dart' as _i2;
import 'package:capstone_project_mobile/pages/layout_page.dart' as _i3;
import 'package:capstone_project_mobile/pages/profile_page.dart' as _i4;
import 'package:capstone_project_mobile/pages/resource_page.dart' as _i5;
import 'package:capstone_project_mobile/pages/therapists_page.dart' as _i6;

abstract class $AppRouter extends _i7.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    ForumPage.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.ForumPage(),
      );
    },
    HomePage.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomePage(),
      );
    },
    LayoutPage.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.LayoutPage(),
      );
    },
    Profile.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.ProfilePage(),
      );
    },
    ResourcePage.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.ResourcePage(),
      );
    },
    TherapistsPage.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.TherapistsPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.ForumPage]
class ForumPage extends _i7.PageRouteInfo<void> {
  const ForumPage({List<_i7.PageRouteInfo>? children})
      : super(
          ForumPage.name,
          initialChildren: children,
        );

  static const String name = 'ForumPage';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i2.HomePage]
class HomePage extends _i7.PageRouteInfo<void> {
  const HomePage({List<_i7.PageRouteInfo>? children})
      : super(
          HomePage.name,
          initialChildren: children,
        );

  static const String name = 'HomePage';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i3.LayoutPage]
class LayoutPage extends _i7.PageRouteInfo<void> {
  const LayoutPage({List<_i7.PageRouteInfo>? children})
      : super(
          LayoutPage.name,
          initialChildren: children,
        );

  static const String name = 'LayoutPage';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i4.ProfilePage]
class Profile extends _i7.PageRouteInfo<void> {
  const Profile({List<_i7.PageRouteInfo>? children})
      : super(
          Profile.name,
          initialChildren: children,
        );

  static const String name = 'Profile';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i5.ResourcePage]
class ResourcePage extends _i7.PageRouteInfo<void> {
  const ResourcePage({List<_i7.PageRouteInfo>? children})
      : super(
          ResourcePage.name,
          initialChildren: children,
        );

  static const String name = 'ResourcePage';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i6.TherapistsPage]
class TherapistsPage extends _i7.PageRouteInfo<void> {
  const TherapistsPage({List<_i7.PageRouteInfo>? children})
      : super(
          TherapistsPage.name,
          initialChildren: children,
        );

  static const String name = 'TherapistsPage';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}
