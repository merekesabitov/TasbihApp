import 'package:flutter/material.dart';
import '../../../services/colors.dart';

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