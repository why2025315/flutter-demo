import 'package:fluter_app/basic/color_demo.dart';
import 'package:fluter_app/basic/complete_grouped_list_demo.dart';
import 'package:fluter_app/basic/expansition_tile.dart';
import 'package:fluter_app/basic/grid_and_list.dart';
import 'package:fluter_app/basic/grid_view_count.dart';
import 'package:fluter_app/basic/grid_view_demo.dart';
import 'package:fluter_app/basic/layout_demo.dart';
import 'package:fluter_app/basic/list_item_diff_type.dart';
import 'package:fluter_app/basic/list_view.dart';
import 'package:fluter_app/basic/list_view_builder.dart';
import 'package:fluter_app/basic/list_view_horizontal.dart';
import 'package:fluter_app/basic/section_list_demo.dart';
import 'package:fluter_app/basic/spaced_items.dart';
import 'package:fluter_app/basic/sticky_headers_demo.dart';
import 'package:fluter_app/personal/personal_screen.dart';
import 'package:fluter_app/personal/personal_screen_detail.dart';
import 'package:fluter_app/scroll/draggable_scroll_demo.dart';
import 'package:fluter_app/scroll/list_wheel_scroll_view.dart';
import 'package:fluter_app/scroll/parallax_recipe.dart';
import 'package:fluter_app/scroll/scroll_screen.dart';
import 'package:fluter_app/scroll/sliver_demo.dart';
import 'package:fluter_app/search/search_screen.dart';
import 'package:fluter_app/search/search_screen_detail.dart';
import 'package:fluter_app/widgets/bottom_navbar.dart';
import 'package:flutter/material.dart';

import 'package:fluter_app/basic/basic_screen.dart';
import "basic/grid_view_extent.dart";
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'root',
);

final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'shell',
);

final _router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/scroll',
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
            GoRoute(
              path: 'draggable-scroll',
              builder: (context, state) => const DraggableScrollDemo(),
            ),
            GoRoute(
              path: 'grid-view-extent',
              builder: (context, state) => const GridViewExtent(),
            ),
            GoRoute(
              path: 'grid-view-count',
              builder: (context, state) =>
                  const GridViewCount(type: GridListDemoType.footer),
            ),
            GoRoute(
              path: 'grid-and-list',
              builder: (context, state) => const GridAndList(),
            ),
            GoRoute(
              path: 'color-demo',
              builder: (context, state) => const ColorDemo(),
            ),
            GoRoute(
              path: 'layout-demo',
              builder: (context, state) => const LayoutDemo(),
            ),
            GoRoute(
              path: 'list-view-demo',
              builder: (context, state) => const ListViewDemo(),
            ),
            GoRoute(
              path: 'expansition-title',
              builder: (context, state) => ExpansitionTileDemo(),
            ),
            GoRoute(
              path: 'section-list-demo',
              builder: (context, state) => SectionListDemo(),
            ),
            GoRoute(
              path: 'sticky-headers-demo',
              builder: (context, state) => StickyHeadersDemo(),
            ),
            GoRoute(
              path: 'complete-grouped-list',
              builder: (context, state) => CompleteGroupedListDemo(),
            ),
            GoRoute(
              path: 'list-view-horizontal',
              builder: (context, state) => ListViewHorizontal(),
            ),
            GoRoute(
              path: 'grid-view-demo',
              builder: (context, state) => GridViewDemo(),
            ),
            GoRoute(
              path: 'list-view-diff-type',
              builder: (context, state) => ListItemDiffType(),
            ),
            GoRoute(
              path: 'spaced-items',
              builder: (context, state) => SpacedItemsDemo(),
            ),
            GoRoute(
              path: 'list-view-builder',
              builder: (context, state) => ListViewBuilder(),
            ),
          ],
        ),
        GoRoute(
          path: '/scroll',
          builder: (context, state) => ScrollScreen(),
          routes: [
            GoRoute(
              path: 'draggable-scroll',
              builder: (context, state) => DraggableScrollDemo(),
            ),
            GoRoute(
              path: 'list-wheel-scroll-view',
              builder: (context, state) => ListWheelScrollViewDemo(),
            ),
            GoRoute(
              path: 'sliver-demo',
              builder: (context, state) => SliverDemo(),
            ),
            GoRoute(
              path: 'parallax-recipe',
              builder: (context, state) => ParallaxRecipeDemo(),
            ),
          ],
        ),
        GoRoute(
          path: '/search',
          builder: (context, state) => const SearchScreen(),
          routes: [
            GoRoute(
              path: 'detail',
              builder: (context, state) => const SearchScreenDetail(),
            ),
          ],
        ),
        GoRoute(
          path: '/personal',
          builder: (context, state) => const PersonalScreen(),
          routes: [
            GoRoute(
              path: 'detail',
              builder: (context, state) => const PersonalScreenDetail(),
            ),
          ],
        ),
      ],
    ),
  ],
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: _router);
  }
}
