import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CounterProvider extends ChangeNotifier {
  int counter = 0;
  final controller = TextEditingController();

  CounterProvider() {
    getCounter();
  }

  Future<void> getCounter() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('counter')) {
      counter = prefs.getInt('counter') ?? 0;
      notifyListeners();
    }
  }

  Future<void> incrementer() async {
    final prefs = await SharedPreferences.getInstance();
    counter++;
    prefs.setInt('counter', counter);
    notifyListeners();
  }

  Future<void> decrementer() async {
    if (counter > 0) {
      final prefs = await SharedPreferences.getInstance();
      counter--;
      prefs.setInt('counter', counter);
      notifyListeners();
    }
  }

  Future<void> zeroing() async {
    if (counter != 0) {
      final prefs = await SharedPreferences.getInstance();
      counter = 0;
      prefs.setInt('counter', counter);
      notifyListeners();
    }
  }

  @override
  void dispose() {
    controller.dispose();
    Hive.close();
    super.dispose();
  }
}
