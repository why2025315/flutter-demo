import 'package:flutter/material.dart';

class ListWheelScrollViewDemo extends StatelessWidget {
  const ListWheelScrollViewDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListWheelScrollView(
      itemExtent: 40,
      // diameterRatio: 1.5,
      // offAxisFraction: -0.5,
      useMagnifier: true,
      magnification: 1.5,
      children: List<Widget>.generate(100, (index) => Text('Item $index')),
    );
  }
}
