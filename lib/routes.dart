import 'package:fluter_app/basic/basic_screen.dart';
import 'package:go_router/go_router.dart';

final _router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const BasicScreen()),
  ],
);
