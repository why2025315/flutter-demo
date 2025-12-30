import 'package:flutter/material.dart';

class SearchScreenDetail extends StatelessWidget {
  const SearchScreenDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('发现')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('返回'),
        ),
      ),
    );
  }
}
