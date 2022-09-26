import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:qr_reader/models/scan_model.dart';
export 'package:qr_reader/models/scan_model.dart';

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
    final path = '${documentsDirectory.path}ScansDB.db';
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

  Future<int> newScanRaw(ScanModel newScan) async {
    final id = newScan.id;
    final tipo = newScan.tipo;
    final valor = newScan.valor;
    final db = await database; // espera a que esté lista
    final res = await db!.rawInsert('''
      INSERT INTO Scans (id, tipo, valor)
      VALUES($id, '$tipo', '$valor')
    º''');
    return res;
  }

  Future<int> newScan(ScanModel newScan) async {
    final db = await database;
    final res = await db!.insert('Scans', newScan.toMap());
    // res es id del último registro insertado
    return res;
  }

  Future<ScanModel?> getScanById(int id) async {
    final db = await database;
    final res = await db!.query('Scans', where: 'id = ?', whereArgs: [id]);
    return res.isNotEmpty 
    ? ScanModel.fromMap(res.first) 
    : null;
  }

   Future<List<ScanModel>?> getScans() async {
    final db = await database;
    final res = await db!.query('Scans');
    return res.isNotEmpty 
    ? res.map((scan) => ScanModel.fromMap(scan)).toList()
    : [];
  }

   Future<List<ScanModel>?> getScanByTipo(String tipo) async {
    final db = await database;
    final res = await db!.rawQuery('''SELECT * FROM Scans WHERE tipo = '$tipo' ''');
    return res.isNotEmpty 
    ? res.map((scan) => ScanModel.fromMap(scan)).toList()
    : [];
  }

}
