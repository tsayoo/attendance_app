import 'package:attendance_app/services/location_services.dart';
import 'package:flutter/material.dart';

class PermissionScreen extends StatefulWidget {
  const PermissionScreen({super.key});

  @override
  State<PermissionScreen> createState() => _PermissionScreenState();
}

class _PermissionScreenState extends State<PermissionScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  void requestPermission() async {
    final hasPermission = await handleLocationPermission(context);

    try {
      
    } catch (e) {
      
    }
  }
}