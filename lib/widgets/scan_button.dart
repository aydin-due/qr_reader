import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';

class ScanButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        elevation: 0,
        child: const Icon(Icons.filter_center_focus),
        onPressed: () async {
          // String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#3d8bef', 'Cancelar', false, ScanMode.QR);
          final barcodeScanRes = 'https://fernando-herrera.com';
          // print(barcodeScanRes);

          final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);
          scanListProvider.newScan(barcodeScanRes);
          scanListProvider.newScan('geo:40.724233047051705,-74.00731459101564');
        });
  }
}
