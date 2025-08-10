import 'package:challenge1/notes/db_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class NotesDBProvider with ChangeNotifier {
 DBHelper dbHelper;

 NotesDBProvider({
   required this.dbHelper
});

  List<Map<String, dynamic>> _mData = [];

  List<Map<String, dynamic>> getNotes() => _mData;

  Future<void> addNote(String title, String desc) async {
    bool check=await dbHelper.addNote(mTitle: title, mDesc: desc);
    if(check){
      _mData=await dbHelper.getAllNotes();
      notifyListeners();
    }
  }

 Future<void> updateNote(String id, String title, String desc) async {
   await dbHelper.updateNote(
     mTitle: title,
     mDesc: desc,
     sno: int.parse(id),
   );
   _mData = await dbHelper.getAllNotes();
   notifyListeners();
 }


 Future<void> deleteNote(String id) async {
    bool check= await dbHelper.deleteNote(sno: int.parse(id));
    if(check){
      _mData=await dbHelper.getAllNotes();
      notifyListeners();
    }
  }

  void getInitialNotes() async {
    _mData= await dbHelper.getAllNotes();
    notifyListeners();
  }
}