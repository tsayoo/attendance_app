import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    elevation : 0,
    backgroundColor : Colors.blueAccent,
    leading : IconButton(
      onPressed: () => Navigator.pop(context),
      icon: const Icon(Icons.arrow_back_ios_rounded),
      ),
      title: const Text(
        'Permission Request Menu',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          
        ),
        ),
  );
}