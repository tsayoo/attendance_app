import 'package:attendance_app/ui/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// an entry point for submitting the attendance report
final CollectionReference dataCollection = FirebaseFirestore.instance.collection('attendance');

Future<void>  submitAttendanceReport(BuildContext context, String address, String name, String attendanceStatus, String timeStamp) async {
  showLoaderDialog(context);
  dataCollection.add(
    {
      'address': address,
      'name': name,
      'description' : attendanceStatus,
      'time' : timeStamp
    }
  ).then((result) {
    Navigator.of(context).pop();
    try {
      // di blok try itu yg sudah benar, cath nya yg negative things
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Row(
          children: [
            Icon(
              Icons.check_circle_outline, 
              color: Colors.white,
            ),
            SizedBox(width: 10),
            Text(
              'Attendance Report submitted successfully',
              style: TextStyle(color: Colors.white),
            )
          ]
        ),
        backgroundColor: Colors.orangeAccent,
        shape: StadiumBorder(),
        behavior: SnackBarBehavior.floating,
      ));
      Navigator.pushReplacement(
        context, 
        MaterialPageRoute(
          builder: (context) => HomeScreen())
      );
    } catch (e) {
      // di blok cath itu yg negative things      e itu error, klo i itu information
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Row(
          children: [
            Icon(
              Icons.info_outline,
              color: Colors.white,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                "Ups, $e",
                style: TextStyle(color: Colors.white),
              )
              )
          ],
        ),
      ));
    }
  });
}

void showLoaderDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    content: Row(
      children: <Widget>[
        CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
          // nampilin muter muter doang
        ),
        Container(
          margin: EdgeInsets.only(left: 20),
          child: Text("Loading..."),
        )
      ],
    ),
  );
  showDialog(
    barrierDismissible: false,
    context: context, 
    builder: (BuildContext context) {
      return alert;
    }
  );
}