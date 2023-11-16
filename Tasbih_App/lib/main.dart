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
              const TopPanel(),
              const CounterPanel(),
              Expanded(child: Container(height: 50, color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}

class TopPanel extends StatelessWidget {
  const TopPanel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                color: Colors.white,
                height: 38,
                width: 276,
              ),
            ),
            Container(
              color: Colors.white,
              height: 38,
              width: 54,
              margin: const EdgeInsets.only(left: 20),
            )
          ],
        ),
    );
  }
}

class CounterPanel extends StatelessWidget {
  const CounterPanel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 14),
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 35,
                    width: 35,
                    color: Colors.blue,
                  ),
                  Container(
                    height: 154,
                    width: 154,
                    color: Colors.blue,
                  ),
                  Container(
                    height: 35,
                    width: 35,
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              height: 45,
              width: double.infinity,
              alignment: Alignment.center,
              child: const Text('Save Dhikr'),
            ),
          ],
        ),
      );
  }
}