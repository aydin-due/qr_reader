import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/db_provider.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';
import 'package:qr_reader/providers/ui_provider.dart';
import 'package:qr_reader/screens/addresses_screen.dart';
import 'package:qr_reader/screens/map_history_screen.dart';
import 'package:qr_reader/screens/map_screen.dart';
import 'package:qr_reader/widgets/custom_navbar.dart';
import 'package:qr_reader/widgets/scan_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial'),
        actions: [
          IconButton(icon: const Icon(Icons.delete_forever), onPressed: () => scanListProvider.deleteScans()),
        ],
      ),
      body: const _HomeScreenBody(),
      bottomNavigationBar: const CustomNavBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomeScreenBody extends StatelessWidget {
  const _HomeScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;
    // DBProvider.db.database;

    // final tmpScan = ScanModel(valor: 'http://google.com');
    // DBProvider.db.newScan(tmpScan);

    // DBProvider.db.getScanById(0).then((scan) => print(scan!.valor));
    // DBProvider.db.getScans().then(print);

    // DBProvider.db.deleteScans().then(print);

    final scanListProvider = Provider.of<ScanListProvider>(context,
        listen: false); //listen false para q no se redibuj

    switch (currentIndex) {
      case 0:
        scanListProvider.loadScanByType('geo');
        return const MapHistoryScreen();
      case 1:
        scanListProvider.loadScanByType('http');
        return const AddressesScreen();
      default:
        return const MapHistoryScreen();
    }
  }
}
