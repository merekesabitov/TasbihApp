import 'package:flutter/material.dart';
import 'counter_panel/counter_panel.dart';
import 'db_panel/db_panel.dart';
import 'top_panel/top_panel.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade50,
      body: const SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              TopPanel(),
              CounterPanel(),
              DBPanel(),
            ],
          ),
        ),
      ),
    );
  }
}
