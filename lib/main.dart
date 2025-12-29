import 'package:flutter/material.dart';

import 'package:fluter_app/basic/basic_screen.dart';
import "./basic/layout_demo.dart";
import 'package:go_router/go_router.dart';

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/basic',
      builder: (context, state) => BasicScreen(),
      routes: [
        GoRoute(path: 'layout', builder: (context, state) => LayoutDemo()),
      ],
    ),
    GoRoute(path: '/', redirect: (context, state) => '/basic'),
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
