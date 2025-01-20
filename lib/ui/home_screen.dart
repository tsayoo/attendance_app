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
        body: Container(),
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
    );
  }
}