import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';
import 'package:qr_reader/widgets/scan_tiles.dart';

class MapHistoryScreen extends StatefulWidget {
  const MapHistoryScreen({Key? key}) : super(key: key);

  @override
  State<MapHistoryScreen> createState() => _MapHistoryScreenState();
}

class _MapHistoryScreenState extends State<MapHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return const ScanTiles(tipo: 'http');
  }
}
