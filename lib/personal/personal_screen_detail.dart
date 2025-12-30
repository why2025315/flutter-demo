import 'package:flutter/material.dart';

class PersonalScreenDetail extends StatelessWidget {
  const PersonalScreenDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('个人详情')),
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
