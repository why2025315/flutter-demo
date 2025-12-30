import 'package:fluter_app/personal/personal_screen.dart';
import 'package:fluter_app/personal/personal_screen_detail.dart';
import 'package:fluter_app/search/search_screen.dart';
import 'package:fluter_app/search/search_screen_detail.dart';
import 'package:fluter_app/widgets/bottom_navbar.dart';
import 'package:flutter/material.dart';

import 'package:fluter_app/basic/basic_screen.dart';
import "./basic/layout_demo.dart";
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'root',
);

final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'shell',
);

final _router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/basic',
  debugLogDiagnostics: true,
  routes: <RouteBase>[
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) => BottomNavbar(child: child),
      routes: <RouteBase>[
        GoRoute(
          path: '/basic',
          builder: (context, state) => BasicScreen(),
          routes: [
            GoRoute(path: 'layout', builder: (context, state) => LayoutDemo()),
          ],
        ),
        GoRoute(
          path: '/search',
          builder: (context, state) => SearchScreen(),
          routes: [
            GoRoute(
              path: 'detail',
              builder: (context, state) => SearchScreenDetail(),
            ),
          ],
        ),
        GoRoute(
          path: '/personal',
          builder: (context, state) => PersonalScreen(),
          routes: [
            GoRoute(
              path: 'detail',
              builder: (context, state) => PersonalScreenDetail(),
            ),
          ],
        ),
      ],
    ),
  ],
);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: _router);
  }
}
