import 'package:attendance_app/services/location_services.dart';
import 'package:attendance_app/services/timestamp_services.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class AttendanceScreen extends StatefulWidget {
  final XFile? image;
  const AttendanceScreen({super.key, this.image});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState(this.image);
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  _AttendanceScreenState(this.image);

  XFile? image;
  String addressPlaceholder = '', datePlaceholder = '', timePlaceholder = '', timeStampPlaceholder = '', statusPlaceholder = 'Attend';
  bool isLoading = false;
  final controllerName = TextEditingController();

  @override 
  void initState() {
    super.initState();
    handleLocationPermission(context);
    setDateTime((date, time, timeStamp) { //siap2 ambil data setelah diterjemahkan ke compiler
      setState(() {
        datePlaceholder = date;
        timePlaceholder = time;
        timeStampPlaceholder = timeStamp;
      });
    });
    setAttendStatus((status) {
      setState(() {
        statusPlaceholder = status;
      });
    });

    if (image != null) {
      isLoading = true;
      getGeoLocationPosition(context, (position) {
        setState(() {
          isLoading = false;
          getAddressFromLongLat(position, (address) {
            setState(() {
              addressPlaceholder = address;              
            });
          });
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: ,
    );
  }
}