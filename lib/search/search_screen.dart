import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('发现')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.go('/search/detail');
          },
          child: const Text('周睿'),
        ),
      ),
    );
  }
}
