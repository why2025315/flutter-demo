import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MenuItem {
  final String title;
  final String route;

  MenuItem({required this.title, required this.route});
}

class BasicScreen extends StatelessWidget {
  BasicScreen({super.key});

  final List<MenuItem> items = [
    MenuItem(title: 'DraggableScrollable', route: '/scroll/draggable-scroll'),
    MenuItem(title: 'GridVew.extent', route: '/basic/grid-view-extent'),
    MenuItem(title: 'GridView.count', route: '/basic/grid-view-count'),
    MenuItem(title: 'Grid and List', route: '/basic/grid-and-list'),
    MenuItem(title: 'Color demo', route: '/basic/color-demo'),
    MenuItem(title: 'Layout Demo', route: '/basic/layout-demo'),
    MenuItem(title: 'List View Demo', route: '/basic/list-view-demo'),
    MenuItem(title: '可展开的分组列表', route: '/basic/expansition-title'),
    MenuItem(title: '自定义分组列表', route: '/basic/section-list-demo'),
    MenuItem(title: '粘性分组头', route: '/basic/sticky-headers-demo'),
    MenuItem(title: '消息列表', route: '/basic/complete-grouped-list'),
    MenuItem(title: '水平滑动列表', route: '/basic/list-view-horizontal'),
    MenuItem(title: '网格布局', route: '/basic/grid-view-demo'),
    MenuItem(title: '不同类型的列表项', route: '/basic/list-view-diff-type'),
    MenuItem(title: 'spaced-items', route: '/basic/spaced-items'),
    MenuItem(title: '长或无限的列表', route: '/basic/list-view-builder'),
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
