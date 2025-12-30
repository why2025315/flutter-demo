import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PersonalScreen extends StatelessWidget {
  const PersonalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('个人中心')),
      body: Center(
        child: TextButton(
          onPressed: () {
            context.go('/personal/detail');
          },
          child: const Text('detil'),
        ),
      ),
    );
  }
}
