import 'package:flutter/material.dart';
import 'package:qr_reader/models/scan_model.dart';
import 'package:qr_reader/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scans = [];
  String tipoSeleccionado = 'http';

  Future<ScanModel> newScan(String valor) async {
    final newScan = ScanModel(valor: valor);
    // añadir scan a bd
    final id = await DBProvider.db.newScan(newScan);
    newScan.id = id;

    // mostrar scan si su tipo coincide con el seleccionado
    if (tipoSeleccionado == newScan.tipo) {
      scans.add(newScan);
      notifyListeners();
    }

    return newScan;
  }

  loadScans() async {
    final scans = await DBProvider.db.getScans();
    this.scans = [...scans!];
    notifyListeners();
  }

  loadScanByType(String type) async {
    final scans = await DBProvider.db.getScanByType(type);
    this.scans = [...scans!];
    tipoSeleccionado = type;
    notifyListeners();
  }

  deleteScans() async {
    await DBProvider.db.deleteScans();
    scans = [];
    notifyListeners();
  }

  deleteScan(int id) async {
    await DBProvider.db.deleteScan(id);
    // loadScanByType(tipoSeleccionado);
  }
}
