import 'package:flutter/material.dart';

class ListViewHorizontal extends StatelessWidget {
  const ListViewHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('水平滑动的列表')),
      body: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          for (final color in Colors.primaries)
            Container(width: 160, color: color),
        ],
      ),
    );
  }
}
