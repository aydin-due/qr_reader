import 'package:flutter/material.dart';
import 'package:qr_reader/screens/home_screen.dart';
import 'package:qr_reader/screens/map_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR Reader',
      initialRoute: 'home',
      routes: {
        'home': (_) => HomeScreen(),
        'map': (_) => MapScreen()
      },
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: Container(
            child: Text('Hello World'),
          ),
        ),
      ),
    );
  }
}