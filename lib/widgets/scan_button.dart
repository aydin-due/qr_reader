import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class ScanButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      child: const Icon(Icons.filter_center_focus),
      onPressed: () {}
    );
  }
}
