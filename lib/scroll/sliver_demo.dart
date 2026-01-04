import 'dart:io';

import 'package:flutter/material.dart';

class SliverDemo extends StatelessWidget {
  const SliverDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            leading: Icon(Icons.baby_changing_station),
            title: Text('Floating App Bar'),
            pinned: true,
            flexibleSpace: Image.asset(
              'assets/images/lake.jpg',
              fit: BoxFit.cover,
            ),
            expandedHeight: 200,
            actions: [
              PopupMenuButton(
                itemBuilder: (context) {
                  return List.generate(3, (index) {
                    return PopupMenuItem(child: Text('child $index'));
                  }).toList();
                },
              ),
            ],
          ),
          SliverList.builder(
            itemBuilder: (constext, index) {
              return ListTile(title: Text('Item #$index'));
            },
            itemCount: 50,
          ),
        ],
      ),
    );
  }
}
