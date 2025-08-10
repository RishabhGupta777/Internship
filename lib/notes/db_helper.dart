import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io' as io;

class DBHelper {
  // Singleton pattern for a single instance of DBHelper
  DBHelper._();
  static final DBHelper getInstance = DBHelper._();

  // Database and table constants
  static Database? myDB;
  final String TABLE_NOTE = "note";
  final String COLUMN_NOTE_SNO = "s_no";
  final String COLUMN_NOTE_TITLE = "title";
  final String COLUMN_NOTE_DESC = "desc";

  // Get or create the database instance
  Future<Database> getDB() async {
    if (myDB != null) {
      return myDB!;
    } else {
      myDB = await openDB();
      return myDB!;
    }
  ///uper wale itne bare if ke function ko chhota krke ye bhi likha jaa sakta h jo niche likha h due to return myDb! bar bar aa raha h
  //   myDB ??= await openDB();
  //   return myDB!;

  }



  // Open the database or create it if it doesn't exist
  Future<Database> openDB() async {
    io.Directory dirPath = await getApplicationDocumentsDirectory();
    String dbPath = join(dirPath.path, "noteDB.db");

    return await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) {
        db.execute(
          "CREATE TABLE $TABLE_NOTE ("
              "$COLUMN_NOTE_SNO INTEGER PRIMARY KEY AUTOINCREMENT,"
              " $COLUMN_NOTE_TITLE TEXT, "
              "$COLUMN_NOTE_DESC TEXT)",
        );
      },
    );
  }

  // Insert a new note into the database
  Future<bool> addNote(
      {required String mTitle, required String mDesc}) async {
    var db = await getDB();
    int rowsEffected = await db.insert(
      TABLE_NOTE,
      {
        COLUMN_NOTE_TITLE: mTitle,
        COLUMN_NOTE_DESC: mDesc,
      },
    );
    return rowsEffected > 0;
  }

  // Retrieve all notes from the database
  Future<List<Map<String, dynamic>>> getAllNotes() async {
    var db = await getDB();
    List<Map<String, dynamic>> mData = await db.query(TABLE_NOTE);
    return mData;
  }

  // Update an existing note
  Future<bool> updateNote(
      {required String mTitle,
        required String mDesc,
        required int sno}) async {
    var db = await getDB();
    int rowsEffected = await db.update(
      TABLE_NOTE,
      {
        COLUMN_NOTE_TITLE: mTitle,
        COLUMN_NOTE_DESC: mDesc,
      },
      where: "$COLUMN_NOTE_SNO = ?",
      whereArgs: [sno],
    );
    return rowsEffected > 0;
  }

  // Delete a note from the database
  Future<bool> deleteNote({required int sno}) async {
    var db = await getDB();
    int rowsEffected = await db.delete(
      TABLE_NOTE,
      where: "$COLUMN_NOTE_SNO = ?",
      whereArgs: [sno],
    );
    return rowsEffected > 0;
  }
}