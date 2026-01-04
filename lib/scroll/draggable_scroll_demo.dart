import 'package:flutter/material.dart';

class DraggableScrollDemo extends StatelessWidget {
  const DraggableScrollDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.1,
      minChildSize: 0.1,
      maxChildSize: 1,
      builder: (context, scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          child: Image.asset('assets/images/lake.jpg', width: 100, height: 100),
        );
      },
    );
  }
}
