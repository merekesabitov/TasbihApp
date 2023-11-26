import 'package:flutter/material.dart';
import 'counter_panel/counter_panel.dart';
import 'db_panel/db_panel.dart';
import 'top_panel/top_panel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isActivity = true;

  void toogle(bool isSaved) {
    if (!isActivity && !isSaved) {
      setState(() {
        isActivity = true;
      });
    } else if (isActivity && isSaved) {
      setState(() {
        isActivity = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade50,
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              TopPanel(
                isActivity: isActivity,
                toogle: toogle,
              ),
              Visibility(visible: isActivity, child: CounterPanel()),
              DBPanel(),
            ],
          ),
        ),
      ),
    );
  }
}
