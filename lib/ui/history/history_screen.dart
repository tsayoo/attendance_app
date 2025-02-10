import 'package:attendance_app/services/data_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class _AttendanceHistoryScreenState extends StatefulWidget {
  const _AttendanceHistoryScreenState({super.key});

  @override
  State<_AttendanceHistoryScreenState> createState() => __AttendanceHistoryScreenStateState();
}

class __AttendanceHistoryScreenStateState extends State<_AttendanceHistoryScreenState> {
  final DataServices dataServices = DataServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance History'),
      ),
      body: StreamBuilder(
        // streambuilder adalah kelas yg membuat UI dan data kita termanaged baik
        stream: dataServices.dataCollection.snapshots(), 
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          // knp ga nulis buildcontext, karna kalo di hover udh ad build contxt, jadi ga perlu di inisialisasi lagi 
          // ctx = context
          if(!snapshot.hasData) {
            return const Center(
              child: Text('There is no Data')
            );
          }
          // kalau data sudah ada, maka kita akan menampilkan data
          final data = snapshot.data!.docs;
          // docs adalah data di firebase
          return ListView.builder(
            itemCount: data.length,
            // item count itu buat jumlah data, klo mau spesifik dikasih []
            itemBuilder: (context, index) {
              // return TODO : Put attendance card UI here
            },
          );
        }
      ),
    );
  }
}