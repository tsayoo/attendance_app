import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DeleteDialog extends StatelessWidget {
  final String documentId;
  final CollectionReference dataCollection;

  const DeleteDialog({super.key, required this.documentId, required this.dataCollection});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Delete Data',
        style: TextStyle(
          fontSize: 18,
          color: Colors.black
        ),
      ),
      content: const Text(
        'Are you sure you want to delete this data?',
        style: TextStyle(
          fontSize: 14,
          color: Colors.black
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            dataCollection.doc(documentId).delete();
            Navigator.of(context).pop();
            // pop buat ngehapus halaman ini. jadi pindah keluar, hilang
          }, 
          child: Text(
            "Yes",
            style: TextStyle(
              fontSize: 14,
              color: Colors.blue
            ),
          )
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          }, 
          child: Text(
            "No",
            style: TextStyle(
              fontSize: 14,
              color: Colors.blueGrey
            ),
          ),
        ),
      ],
    );
  }
}