import 'package:flutter/material.dart';
import 'pages/home/home.dart';

void main() {
  runApp(const Tasbih());
}

class Tasbih extends StatelessWidget {
  const Tasbih({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Gilroy-Medium',
      ),
      home: const HomePage(),
    );
  }
}