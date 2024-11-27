import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meditasi_app/view/widget/location_button.dart';
import 'package:meditasi_app/view/widget/maps.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Position? _currentPosition;
  String _locationMessage = "Menunggu lokasi...";
  bool _isLoading = false;

  Future<void> _getCurrentLocation() async {
    setState(() {
      _isLoading = true;
      _locationMessage = "Mencari lokasi...";
    });

    try {
      // Periksa apakah layanan lokasi aktif
      if (!await Geolocator.isLocationServiceEnabled()) {
        await Geolocator.openLocationSettings();
        throw Exception('Layanan lokasi tidak aktif');
      }

      // Periksa izin lokasi
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw Exception('Izin lokasi ditolak');
        }
      }
      if (permission == LocationPermission.deniedForever) {
        throw Exception('Izin lokasi ditolak secara permanen');
      }

      // Ambil lokasi terkini
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
      );
      setState(() {
        _currentPosition = position;
        _locationMessage =
            "Latitude: ${position.latitude}, Longitude: ${position.longitude}";
      });
    } catch (e) {
      setState(() {
        _locationMessage = "Gagal mendapatkan lokasi: ${e.toString()}";
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lokasi Pengguna'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Tampilkan loading spinner jika sedang memproses
            if (_isLoading)
              const CircularProgressIndicator(),
            if (!_isLoading)
              Text(
                _locationMessage,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18),
              ),
            const SizedBox(height: 20),

            // Tombol untuk mendapatkan lokasi
            LocationButton(
              onLocationFetched: (position) {
                setState(() {
                  _currentPosition = position;
                  _locationMessage =
                      'Latitude: ${position.latitude}, Longitude: ${position.longitude}';
                });
              },
            ),
            const SizedBox(height: 20),

            // Tombol untuk membuka peta jika lokasi tersedia
            if (_currentPosition != null)
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Maps(
                        latitude: _currentPosition!.latitude,
                        longitude: _currentPosition!.longitude,
                      ),
                    ),
                  );
                },
                child: const Text('Tampilkan di Google Maps'),
              ),
          ],
        ),
      ),
    );
  }
}
