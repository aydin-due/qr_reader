import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:qr_reader/providers/db_provider.dart';

class MapScreen extends StatelessWidget {
   
  const MapScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final ScanModel scan = ModalRoute.of(context)!.settings.arguments as ScanModel;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapa'),
      ),
      body: Center(
         child: Text(scan.valor),
      ),
    );
  }
}