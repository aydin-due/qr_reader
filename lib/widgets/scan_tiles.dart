import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';

class ScanTiles extends StatelessWidget {
  const ScanTiles({Key? key, required this.tipo}) : super(key: key);

  final String tipo;

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context); // dentro de build listen: true xq se actualiza (redibuja)
    final scans = scanListProvider.scans;

    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (_, i) => Dismissible(
        key: UniqueKey(),
        background: Container(
          color: Colors.red,
        ),
        onDismissed: (DismissDirection direction) {
          // listen: false en funciones xq no se redibuja
          Provider.of<ScanListProvider>(context, listen: false).deleteScan((scans[i].id!));
        },
        child: ListTile(
          leading: Icon(
            tipo == 'http' 
              ? Icons.home_outlined 
              : Icons.map, 
            color: Theme.of(context).primaryColor),
          title: Text(scans[i].valor),
          subtitle: Text(scans[i].id.toString()),
          trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.grey),
          onTap: () => print('si'),
        ),
      ),
    );
  }
}
