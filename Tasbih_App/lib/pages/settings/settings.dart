import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('Settings Page'),
            TextButton(
              onPressed: () {
              context.go('/');
            },
            child: const Text('Перейти еще раз на глвную'),
            ),
            TextButton(onPressed: () {
              context.pop();
            },
            child: const Text('Перейти еще раз на глвную'),
            ),
          ],
        ),
      ),
    );
  }
}