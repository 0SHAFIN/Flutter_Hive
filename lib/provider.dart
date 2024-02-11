import 'package:flutter/material.dart';

class incremenT with ChangeNotifier {
  int n = 0;

  increment() {
    n = n + 1;
    notifyListeners();
  }
}
