import 'package:flutter/material.dart';
import '../../../services/colors.dart';

class CounterPanel extends StatefulWidget {
  const CounterPanel({super.key});

  @override
  State<CounterPanel> createState() => _CounterPanelState();
}

class _CounterPanelState extends State<CounterPanel> {
  int counter = 0;

  void incrementer() {
    setState(() => counter++);
  }

  void decrementer() => (counter > 0) ? setState(() => counter--) : null;
  
  void zeroing() => (counter != 0) ? setState(() => counter = 0) : null;

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
                  onTap:() => decrementer(),
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
                  onTap:() => incrementer(),
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
          Container(
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
        ],
      ),
    );
  }
}
