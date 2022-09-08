import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/ui_provider.dart';
import 'package:qr_reader/screens/addresses_screen.dart';
import 'package:qr_reader/screens/map_screen.dart';
import 'package:qr_reader/widgets/custom_navbar.dart';
import 'package:qr_reader/widgets/scan_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial'),
        actions: [
          IconButton(icon: const Icon(Icons.delete_forever), onPressed: () {})
        ],
      ),
      body: _HomeScreenBody(),
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
    
    switch (currentIndex) {
      case 0:
        return const MapScreen();
      case 1:
        return const AddressesScreen();
      default:
        return const MapScreen();
    }
  }
}
