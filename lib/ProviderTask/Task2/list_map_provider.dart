import 'package:flutter/material.dart';

class ListMapProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _mData = []; // The private field for the contact list

  // events

  void addData(Map<String, dynamic> data) {
    _mData.add(data);
    notifyListeners();
  }

  void updateData(Map<String, dynamic> updatedData, int index) {
    _mData[index] = updatedData;
    notifyListeners();
  }

  void deleteData(int index) {
    _mData.removeAt(index);
    notifyListeners();
  }

  List<Map<String, dynamic>> getData() => _mData;
}