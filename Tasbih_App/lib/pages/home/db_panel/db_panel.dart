import 'package:flutter/material.dart';
import 'package:flutter_application_1/db/db_fake.dart';
import 'package:intl/intl.dart';
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
              itemCount: fakeDB.length,
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
                        fakeDB[index].counter.toString(),
                        style: const TextStyle(
                          fontSize: 20,
                          fontFamily: 'Gilroy-Bold',
                          color: myBlue,
                          ),
                        ),
                      ),
                    Container(height: 30, width: 2, color: Colors.white),
                    Expanded (
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 15),
                        child: Text(
                          fakeDB[index].title,
                          style: const TextStyle(fontSize: 12,),
                          maxLines: 2
                        ),
                      ),
                    ),
                    Text(
                      DateFormat('dd.MM.yyyy').format(fakeDB[index].date),
                      style: const TextStyle(
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