import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._(); // ._ constructor privado

  DBProvider._(); // al hacer un build, siempre obtener la misma instancia

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  Future<Database> initDB() async {
    // path de donde almacenar la base de datos
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = documentsDirectory.path + 'ScansDB.db';
    print(path);

    // crear base de datos
    return await openDatabase(
      path,
      version: 1, // incrementar cuando se quiere volver a ejecutar la creación
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE Scans (
            id INTEGER PRIMARY KEY,
            tipo TEXT,
            valor TEXT
          )''');
      },
    );
  }
}
