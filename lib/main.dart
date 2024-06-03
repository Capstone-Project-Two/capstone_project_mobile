import 'package:capstone_project_mobile/theme/app_theme.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:capstone_project_mobile/route/app_router.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');
  final appRouter = AppRouter();
  runApp(MyApp(appRouter: appRouter));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({super.key, required this.appRouter}); // Use super parameters

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
