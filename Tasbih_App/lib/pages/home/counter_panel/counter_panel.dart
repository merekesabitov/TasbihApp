import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/dhikr.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../services/colors.dart';

class CounterPanel extends StatefulWidget {
  final Function func;
  const CounterPanel({super.key, required this.func});

  @override
  State<CounterPanel> createState() => _CounterPanelState();
}

class _CounterPanelState extends State<CounterPanel> {
  final controller = TextEditingController();
  int counter = 0;

  @override
  void initState() {
    getCounter();
    super.initState();
  }

  Future<void> getCounter() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('counter')) {
      counter = prefs.getInt('counter') ?? 0;
      setState(() {});
    }
  }

  Future<void> incrementer() async {
    final prefs = await SharedPreferences.getInstance();
    counter++;
    prefs.setInt('counter', counter);
    setState(() {});
  }

  Future<void> decrementer() async {
    if (counter > 0) {
      final prefs = await SharedPreferences.getInstance();
      counter--;
      prefs.setInt('counter', counter);
      setState(() {});
    }
  }

  Future<void> zeroing() async {
    if (counter != 0) {
      final prefs = await SharedPreferences.getInstance();
      counter = 0;
      prefs.setInt('counter', counter);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            margin: const EdgeInsets.only(bottom: 14),
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () => decrementer(),
                  child: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: myBlue,
                    ),
                    child: Image.asset('assets/img/decrement.png'),
                  ),
                ),
                GestureDetector(
                  onTap: () => incrementer(),
                  child: Container(
                    height: 154,
                    width: 154,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: myBlue,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 10),
                        Text(
                          counter.toString(),
                          style: const TextStyle(
                            fontSize: 48,
                            fontFamily: 'Gilroy-Bold',
                            color: Colors.white,
                          ),
                        ),
                        const Text(
                          'Dhikr',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Gilroy-Bold',
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => zeroing(),
                  child: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: myBlue,
                    ),
                    child: Image.asset('assets/img/refresh.png'),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Add Dhikr'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Current Dhikr count: $counter'),
                        const SizedBox(height: 10),
                        CupertinoTextField(
                          controller: controller,
                          placeholder: 'Enter title of Dhikr',
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancel'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Hive.box<Dhikr>('dhikrs').add(Dhikr(
                              counter: counter,
                              title: controller.text,
                              date: DateTime.now()));

                          controller.clear();
                          //widget.func();
                          Navigator.pop(context);
                        },
                        child: const Text('Save'),
                      ),
                    ],
                  );
                },
              );
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
              height: 45,
              width: double.infinity,
              alignment: Alignment.center,
              child: const Text(
                'Save Dhikr',
                style: TextStyle(color: myBlue),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
