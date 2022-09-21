import 'package:sqflite/sqflite.dart';

class DBProvider {
  static Database _database;
  static final DBProvider db = DBProvider._(); // ._ constructor privado

  DBProvider._(); // al hacer un build, siempre obtener la misma instancia

  Future<Database> get database async{
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  Future<Database> initDB() async {

  }
}