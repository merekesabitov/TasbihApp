import 'package:flutter/material.dart';

const Color myBlue = Color(0xFF4664FF);

void main() {
  runApp(const Tasbih());
}

class Tasbih extends StatelessWidget {
  const Tasbih({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Gilroy-Medium',
      ),
      home: const HomePage(),
    );
  }
}

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
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 38,
                width: 276,
                padding: const EdgeInsets.all(4),
                child: Row(
                  children: [
                    Expanded(child:
                    Container(
                      height: 30, 
                      decoration: BoxDecoration(
                        color: myBlue,
                        borderRadius: BorderRadius.circular(8),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          'Activity',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    Expanded(child:
                    Container(
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          'Saved',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              height: 38,
              width: 54,
              margin: const EdgeInsets.only(left: 20),
              child: Image.asset('assets/img/menu.png'),
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
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              margin: const EdgeInsets.only(bottom: 14),
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: myBlue,
              ),
              child: Image.asset('assets/img/decrement.png'),
                  ),
                  Container(
                    height: 154,
                    width: 154,
                    decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: myBlue,
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  Text(
                    '33',
                    style: TextStyle(fontSize: 48,
                    fontFamily: 'Gilroy-Bold',
                    color: Colors.white,),
                  ),
                  Text(
                    'Dhikr',
                    style: TextStyle(fontSize: 12,
                    fontFamily: 'Gilroy-Bold',
                    color: Colors.white,),
                  ),
                ],
              ),
                  ),
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: myBlue,
              ),
              child: Image.asset('assets/img/refresh.png'),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5)
                ),
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

class DBPanel extends StatelessWidget {
  const DBPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10)),
      ),
      height: 50,
      width: double.infinity,
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Last Saved Dhikrs',
            style: TextStyle(
              fontFamily: 'Gilroy-Bold',
          ),
          ),
          Container(
            width: 60,
            height: 2,
            margin: const EdgeInsets.only(top: 5, bottom: 25),
            color: myBlue,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFF9F9F9),
                    borderRadius: BorderRadius.circular(10)
                  ),
                margin: const EdgeInsets.only(bottom: 10),
                child: 
                Row(
                  children: [
                    Container(
                      width: 50,
                      alignment: Alignment.center,
                      child: Text(
                        index.toString(),
                        style: const TextStyle(
                          fontSize: 20,
                          fontFamily: 'Gilroy-Bold',
                          color: myBlue,
                          ),
                        ),
                      ),
                    Container(height: 30, width: 2, color: Colors.white),
                    const Expanded (
                      child: Padding(
                        padding: EdgeInsets.only(left: 20, right: 15),
                        child: Text(
                          'This text  will be in Database Panel. This text  will be in Database Panel. This text  will be in Database Panel.',
                          style: TextStyle(fontSize: 12,),
                          maxLines: 2
                        ),
                      ),
                    ),
                    const Text(
                      '21.11.2023',
                      style: TextStyle(
                        fontSize: 10,
                        color: Color(0xFF9F9F9F),
                      ),
                    ),
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: Image.asset('assets/img/edit.png'),
                    ),
                  ],
                ),
              );
            },
            ),
          ),
        ],
      ),
      ));
  }
}