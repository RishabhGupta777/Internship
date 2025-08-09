import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class DBProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Map<String, dynamic>> _mData = [];

  List<Map<String, dynamic>> getNotes() => _mData;

  // DBProvider() {       -->constructor of DBProvider class for calling from main.dart and start using getInitialNodes();
  //   getInitialNotes();
  // }
  /// if you comment out DBProvider() { getInitialNotes(); } and your app still works,
  /// it's because you've likely moved that call to initState in your HomePage. While this works,
  /// there are key reasons to keep the call in the provider's constructor.
  //Calling getInitialNotes() from initState ties the data fetching process to a specific widget.
  // If you were to create another screen that also needs the note data, you would have to remember to add the same initState call there,

  Future<void> addNote(String title, String desc) async {
    try {
      await _firestore.collection('notes').add({
        'title': title,
        'description': desc,
        'timestamp': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error adding note: $e');
      }
    }
  }

  Future<void> updateNote(String id, String title, String desc) async {
    try {
      await _firestore.collection('notes').doc(id).update({
        'title': title,
        'description': desc,
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error updating note: $e');
      }
    }
  }

  Future<void> deleteNote(String id) async {
    try {
      await _firestore.collection('notes').doc(id).delete();
    } catch (e) {
      if (kDebugMode) {
        print('Error deleting note: $e');
      }
    }
  }

  void getInitialNotes() {
    _firestore
        .collection('notes')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .listen((snapshot) {
      _mData = snapshot.docs.map((doc) {
        return {
          'id': doc.id,
          'title': doc['title'],
          'description': doc['description'],
        };
      }).toList();
      notifyListeners();   //-> jo bhi ise listen krega uske uper data aa jaega then UI me reflect krega
    });
  }
}