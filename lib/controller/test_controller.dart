import 'package:flutter/material.dart';

class TestController extends ChangeNotifier {
  int counter = 0;

  incrementTest() {
    counter++;
    notifyListeners();
  }

  decrementTest() {
    if (counter > 0) {
      counter--;
    }
    notifyListeners();
  }

  refreshTest() {
    counter = 0;
    notifyListeners();
  }
}
