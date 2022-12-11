import 'package:flutter/material.dart';
import 'package:qr_reader/providers/db_provider.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchURL(BuildContext context, ScanModel scan) async {
  if (scan.tipo == 'http') {
    final Uri url = Uri.parse(scan.valor);
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  } else {
    Navigator.pushNamed(context, 'map', arguments: scan);
  }
}
