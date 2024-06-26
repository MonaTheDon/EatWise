import 'package:flutter/material.dart';

class NavBarProvider with ChangeNotifier {
  int _currentIndex = 2;

  int get currentIndex => _currentIndex;

  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
