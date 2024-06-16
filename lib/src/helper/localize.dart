import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

Future<Position?> localize() async {
  final geolocator = GeolocatorPlatform.instance;
  if (!(await geolocator.isLocationServiceEnabled())) {
    return await geolocator.checkPermission().then((permission) async {
      if (permission == LocationPermission.always ||
          permission == LocationPermission.whileInUse) {
        return await localize();
      } else {
        return null;
      }
    });
  }

  try {
    final permission = await geolocator.requestPermission();
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      return await geolocator.getCurrentPosition();
    } else {
      final check = await geolocator.checkPermission();
      if (check == LocationPermission.always ||
          check == LocationPermission.whileInUse) {
        return await localize();
      } else {
        return null;
      }
    }
  } on Exception catch (e) {
    debugPrint(e.toString());
    return null;
  }
}

Future<String> getCountryFromPosition(Position position) async {
  List<Placemark> placemarks =
      await placemarkFromCoordinates(position.latitude, position.longitude);
  return placemarks.first.country!;
}
