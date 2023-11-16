import 'package:flutter/material.dart';

void main() {
  runApp(const Tasbih());
}

class Tasbih extends StatelessWidget {
  const Tasbih({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange.shade50,
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Container(
                  height: 38,
                  color: Colors.white,
                  margin: const EdgeInsets.only(bottom: 20,)
              ),
              Container(
                height: 260,
                color: Colors.white,
                margin: const EdgeInsets.only(bottom: 15),
              ),
              Expanded(child: Container(height: 50, color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}
