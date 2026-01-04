import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MenuItem {
  final String title;
  final String route;

  MenuItem({required this.title, required this.route});
}

class ScrollScreen extends StatelessWidget {
  ScrollScreen({super.key});

  final List<MenuItem> items = [
    MenuItem(title: 'DraggableScrollable', route: '/scroll/draggable-scroll'),
    MenuItem(
      title: 'ListWheelScrollView',
      route: '/scroll/list-wheel-scroll-view',
    ),
    MenuItem(title: 'Sliver Demo', route: '/scroll/sliver-demo'),
    MenuItem(title: 'parallax recipe', route: '/scroll/parallax-recipe'),
  ];

  Widget itemBuilder(BuildContext context, int index) {
    return ListTile(
      title: Text(items[index].title),
      onTap: () {
        context.go(items[index].route);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('基础组件用法')),
      body: ListView.builder(itemCount: items.length, itemBuilder: itemBuilder),
    );
  }
}
