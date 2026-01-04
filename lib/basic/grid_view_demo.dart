import 'package:flutter/material.dart';

class GridViewDemo extends StatelessWidget {
  const GridViewDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('网格布局')),
      body: GridView.count(
        crossAxisCount: 4,
        children: List.generate(100, (index) {
          return Center(
            child: Text(
              'Item $index',
              style: TextTheme.of(context).headlineSmall,
            ),
          );
        }),
      ),
    );
  }
}
