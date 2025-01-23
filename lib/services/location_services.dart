import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

Future<void> getGeoLocationPosition(BuildContext context, Function(Position) onPositionReceived) async {
  Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
  onPositionReceived(position);
}

Future<void> getAddressFromLongLat(Position position, Function(String) onAddressReceived) async {
  List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
  // lat vertikal long horizontal
  Placemark place = placemarks[0];
  String address = "${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}";
  // string interplation = string dlm string $
  onAddressReceived(address);
}

Future<bool> handleLocationPermission(BuildContext context) async {
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Row(
        children: [
          Icon(
            Icons.location_off,
            color: Colors.white,
          ),
          SizedBox(width: 10),
          Text(
            "Location services are disabled. Please enable the services",
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
      backgroundColor: Colors.blueGrey,
      shape: StadiumBorder(),
      behavior: SnackBarBehavior.floating,
    ));
    return false;
  }
  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Row(
        children: [
          Icon(
            Icons.location_off,
            color: Colors.white,
          ),
          SizedBox(width: 10),
          Text(
            "Location Permission denied",
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
      backgroundColor: Colors.blueGrey,
      shape: StadiumBorder(),
      behavior: SnackBarBehavior.floating,
      ));
    }
  }

  if (permission == LocationPermission.deniedForever) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Row(
        children: [
          Icon(
            Icons.location_off,
            color: Colors.white,
          ),
          SizedBox(width: 10),
          Text(
            "Location permission denied forever, we cannot access",
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
      backgroundColor: Colors.blueGrey,
      shape: StadiumBorder(),
      behavior: SnackBarBehavior.floating,
      ));
  }
  return true;
}
