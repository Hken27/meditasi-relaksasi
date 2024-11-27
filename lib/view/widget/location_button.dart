import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationButton extends StatelessWidget {
  final Function(Position) onLocationFetched;

  const LocationButton({required this.onLocationFetched, super.key});

  Future<void> _fetchLocation(BuildContext context) async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
      );
      onLocationFetched(position);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal mendapatkan lokasi: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _fetchLocation(context),
      child: const Text('Cari Lokasi'),
    );
  }
}
