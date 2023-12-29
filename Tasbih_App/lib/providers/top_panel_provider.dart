import 'package:flutter/material.dart';

class TopPanelProvider extends ChangeNotifier {
  bool isActivity = true;

  void toogle(bool isSaved) {
    if (!isActivity && !isSaved) {
      isActivity = true;

      notifyListeners();
    } else if (isActivity && isSaved) {
      isActivity = false;

      notifyListeners();
    }
  }

  void mySetState() {
    notifyListeners();
  }
}
