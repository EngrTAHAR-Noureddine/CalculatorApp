import 'dart:io';

import 'package:calculatorflutter/history_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
   DBProvider._();
  static final DBProvider db = DBProvider._();
  static Database _database;

  Future<Database> get database async {
    // ignore: unnecessary_null_comparison
    if (_database != null)
      return _database;

    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }


  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "TestDB.db");
    return await openDatabase(path, version: 1, onOpen: (db) {
    }, onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE History ("
          "id INTEGER PRIMARY KEY,"
          "operand TEXT,"
          "result TEXT"
          ")");
    });
  }


   newHistory(History newHistory) async {
     final db = await database;
     var res = await db.insert("History", newHistory.toMap());
     return res;
   }


   Future<List<History>> getAllHistories() async {
     final db = await database;
     var res = await db.query("History");
     List<History> list =
     res.isNotEmpty ? res.map((c) => History.fromMap(c)).toList() : [];
     return list;
   }

   deleteAll() async {
     final db = await database;
     //db.rawDelete("Delete * from History");
     try{

       await db.transaction((txn) async {
         var batch = txn.batch();
         batch.delete("History");
         await batch.commit();
       });
     } catch(error){
       throw Exception('DbBase.cleanDatabase: ' + error.toString());
     }
   }

}