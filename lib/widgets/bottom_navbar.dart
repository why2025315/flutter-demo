import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: '发现'),
          BottomNavigationBarItem(
            icon: Icon(Icons.personal_injury),
            label: '我的',
          ),
        ],

        currentIndex: _calculateSelectedIndex(context),
        onTap: (int idx) {
          _onItemTapped(idx, context);
        },
      ),
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.path;
    if (location.startsWith('/basic')) {
      return 0;
    }
    if (location.startsWith('/search')) {
      return 1;
    }
    if (location.startsWith('/personal')) {
      return 2;
    }
    return 0;
  }

  void _onItemTapped(int idx, BuildContext context) {
    switch (idx) {
      case 0:
        GoRouter.of(context).go('/basic');
        break;
      case 1:
        GoRouter.of(context).go('/search');
        break;
      case 2:
        GoRouter.of(context).go('/personal');
        break;
    }
  }
}
