import 'package:flutter/foundation.dart';

class CounterProvider extends ChangeNotifier {
  int _count = 0;

  // Getter to access the count
  int getCount() => _count;

  // Method to increment count
  void incrementCount(int value) {
    _count+=value;
    notifyListeners();
  }

  // Method to decrement count
  void decrementCount() {
    if (_count > 0) {
      _count--;
      notifyListeners();
    }
  }
}
