import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Maps extends StatelessWidget {
  final double latitude;
  final double longitude;

  const Maps({required this.latitude, required this.longitude, super.key});

  Future<void> _openGoogleMaps() async {
    final url = 'https://www.google.com/maps?q=$latitude,$longitude';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw Exception('Tidak dapat membuka Google Maps');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Peta Lokasi'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _openGoogleMaps,
          child: const Text('Buka di Google Maps'),
        ),
      ),
    );
  }
}
