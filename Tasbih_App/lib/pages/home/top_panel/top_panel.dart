import 'package:flutter/material.dart';
import '../../../services/colors.dart';

class TopPanel extends StatelessWidget {
  final Function toogle;
  final bool isActivity;
  const TopPanel({required this.isActivity, required this.toogle, super.key});

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
                    GestureDetector(
                      onTap: () => toogle(false),
                      child: Container(
                        height: 30, 
                        decoration: BoxDecoration(
                          color: isActivity ? myBlue : Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'Activity',
                            style: TextStyle(
                              color: isActivity ? Colors.white : Colors.black,
                              fontSize: 12,
                            ),
                          ),
                        ),
                    ),
                    ),
                    Expanded(child:
                    GestureDetector(
                      onTap: () => toogle(true),
                      child: Container(
                        height: 30,
                        decoration: BoxDecoration(
                          color: isActivity ? Colors.white : myBlue,
                          borderRadius: BorderRadius.circular(8),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'Saved',
                            style: TextStyle(
                              color: isActivity ? Colors.black : Colors.white,
                              fontSize: 12,
                            ),
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