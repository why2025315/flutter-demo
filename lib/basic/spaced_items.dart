import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SpacedItemsDemo extends StatelessWidget {
  const SpacedItemsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    const items = 40;
    return Scaffold(
      appBar: AppBar(title: Text('Spaced Items')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  items,
                  (index) => ItemWidget(text: 'Item $index'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ItemWidget extends StatelessWidget {
  const ItemWidget({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(height: 100, child: Center(child: Text(text))),
    );
  }
}
