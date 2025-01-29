import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.blueAccent,
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back_ios_new,
        color: Colors.white,
      ),
      onPressed: () => Navigator.of(context).pop(),
    ),
    title: Text(
      "Attendance Menu",
      style: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}