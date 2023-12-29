import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/dhikr.dart';
import 'package:flutter_application_1/providers/counter_provider.dart';
import 'package:flutter_application_1/providers/top_panel_provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import '../../../services/colors.dart';

class CounterPanel extends StatelessWidget {
  const CounterPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final counterProvider = context.read<CounterProvider>();

    return Visibility(
      visible: context.watch<TopPanelProvider>().isActivity,
      child: Container(
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
                    onTap: () => counterProvider.decrementer(),
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
                    onTap: () => counterProvider.incrementer(),
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
                          const CounterView(),
                          Text(
                            'Dhikr'.tr(),
                            style: const TextStyle(
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
                    onTap: () => counterProvider.zeroing(),
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
                      title: Text('Add Dhikr'.tr()),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${'Current counter:'.tr()} ${counterProvider.counter}'),
                          const SizedBox(height: 10),
                          CupertinoTextField(
                            controller: counterProvider.controller,
                            placeholder: 'Enter title of Dhikr'.tr(),
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Cancel'.tr()),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Hive.box<Dhikr>('dhikrs').add(Dhikr(
                                counter: counterProvider.counter,
                                title: counterProvider.controller.text,
                                date: DateTime.now()));
    
                            counterProvider.controller.clear();
                            //widget.func();
                            Navigator.pop(context);
                          },
                          child: Text('Save'.tr()),
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
                child: Text(
                  'Save Dhikr'.tr(),
                  style: const TextStyle(color: myBlue),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      context.watch<CounterProvider>().counter.toString(),
      style: const TextStyle(
        fontSize: 48,
        fontFamily: 'Gilroy-Bold',
        color: Colors.white,
      ),
    );
  }
}
