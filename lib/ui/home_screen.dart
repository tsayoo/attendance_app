import 'package:attendance_app/ui/attend/attendance_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      // ignore: deprecated_member_use
      onPopInvoked: (didPop) { //utk tombol back
        if (didPop) {
          return;
        }
        _onWillPop;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildMenuItem(
                  context, 
                  imagePath: "/assets/images/ic_absen.png", 
                  label: "Attendance report", 
                  destination: AttendanceScreen()
                  ),
                SizedBox(height: 40),
                _buildMenuItem(
                  context, 
                  imagePath: "/assets/images/ic_history.png", 
                  label: "Attendance report", 
                  destination: AttendanceScreen()
                  ),
                SizedBox(height: 40),
                _buildMenuItem(
                  context, 
                  imagePath: "/assets/images/ic_history.png", 
                  label: "Attendance History", 
                  destination: AttendanceScreen()
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
      required String imagePath,
      required String label,
      required Widget destination
    }) {
    return Container(
                margin: const EdgeInsets.all(10),
                child: Expanded(
                  child: InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () {
                      Navigator.push(
                        context, MaterialPageRoute(builder: (context) => destination));
                    },
                    child: Column(
                      children: [
                        Image(
                          image: AssetImage(imagePath),
                          height: 100,
                          width: 100,
                        ),
                        SizedBox(height: 10,) ,
                        Text(
                          label,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
  }

  Future<bool> _onWillPop(BuildContext context) async {
    //mau bikin konfirmation exit
    return (await showDialog(
      barrierDismissible: false, //biar ga bisa di tap di luar box yes / no 
      context: context, 
      builder: (context) =>
      AlertDialog(
        title: Text(
          "INFORMATION",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
        ),
        content: Text(
          "Do You Want To Exit?",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false), 
            child: Text(
              "NO",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14
              )
            )
           ),
           TextButton(
            onPressed: () => SystemNavigator.pop(), //utk keluar dgn button bukan dgn home atau back
            child: Text(
              "YES",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14
              )
            )
            )
          ]
        )
      )
      // ini adalah default value ktika smua kode yg ada di blok alert dialog tdk tereksekusi karena beberapa hal 
    );
  }
}