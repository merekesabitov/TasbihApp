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

class TopPanel extends StatelessWidget {
  const TopPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10, bottom: 20),
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
  const CounterPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 14),
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

class DBPanel extends StatelessWidget {
  const DBPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Container(
      height: 50,
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Last Saved Dhikrs',
            style: TextStyle(fontWeight: FontWeight.bold,
          ),
          ),
          Container(
            width: 60,
            height: 2,
            margin: const EdgeInsets.only(top: 5, bottom: 25),
            color: Colors.blue,
          ),
          Column(
            children: [
              Container(
                width: double.infinity,
                height: 49,
                margin: const EdgeInsets.only(bottom: 10),
                color: Colors.blue,
              ),
              Container(
                width: double.infinity,
                height: 49,
                margin: const EdgeInsets.only(bottom: 10),
                color: Colors.blue,
              ),
              Container(
                width: double.infinity,
                height: 49,
                margin: const EdgeInsets.only(bottom: 10),
                color: Colors.blue,
              ),
            ],
          )
        ],
      ),
      ));
  }
}