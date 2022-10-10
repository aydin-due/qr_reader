import 'package:flutter/material.dart';

class MapHistoryScreen extends StatelessWidget {
  const MapHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (_, i) => ListTile(
        leading: Icon(Icons.map, color: Theme.of(context).primaryColor),
        title: Text('http://google.com'),
        subtitle: Text('id: 1'),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.grey),
        onTap: () => print('si'),
      ),
    );
  }
}
