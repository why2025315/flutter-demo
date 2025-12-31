import 'package:flutter/material.dart';

import 'package:flutter/rendering.dart';

void showLayoutGuidelines() {
  debugPaintSizeEnabled = true;
}

class GridViewExtent extends StatelessWidget {
  const GridViewExtent({super.key});

  @override
  Widget build(BuildContext context) {
    showLayoutGuidelines();
    return Scaffold(
      appBar: AppBar(title: const Text('GridView.Extent')),
      body: GridView.extent(
        maxCrossAxisExtent: 150,
        padding: const EdgeInsets.all(4),
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children: _buildGridTileList(30),
      ),
    );
  }

  List<Widget> _buildGridTileList(int count) {
    return List.generate(count, (int i) {
      return Image.network(
        Uri.https('picsum.photos', 'id/$i/150/150').toString(),
      );
    });
  }
}
