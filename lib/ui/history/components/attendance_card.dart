import 'dart:math';
import 'package:attendance_app/ui/history/components/delete_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AttendanceHistoryCard extends StatelessWidget {
  final Map<String, dynamic> data;
  // map itu pasangan key Value
  final VoidCallback onDelete;

  const AttendanceHistoryCard({super.key, required this.data, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        DeleteDialog(
          documentId: data["id"], 
          dataCollection: FirebaseFirestore.instance.collection('attendance'),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 5,
        margin: EdgeInsets.all(10),
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    data["name"][0].toUpperCase(),
                    style: TextStyle(
                      fontSize: 14, 
                      color: Colors.white
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: Text(
                            "Student Name : ",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            data["name"],
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14
                            ),
                          ),
                        ),
                      ]
                    ),
                    Row(
                      children: [
                        Text(
                          "Attendance Status : ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14
                          ),
                        ),
                        Text(
                          data["description"],
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}