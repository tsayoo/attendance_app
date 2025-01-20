import 'package:attendance_app/ui/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp( //diinisialisai sblm digunakan
    options: const FirebaseOptions(
      //data diambil dari file google-services.json
      apiKey: 'AIzaSyDJ4h6S5ic3-EztOmUo-_mk62MV03D0SPM', //dari current key di google srvices
      appId: '1:1005605501577:android:e27467c4363a8b4b0ae458', //dri mobilesdk_app_id 
      //1 artinya baru pertama konfigurasi di firebase
      messagingSenderId: '1005605501577',  //dri project number
      projectId: 'attendance-app-8f51d' //dari project id
      )
  );
  runApp(AttendanceApp());
}

class AttendanceApp extends StatelessWidget {
  const AttendanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        cardTheme: CardTheme(surfaceTintColor: Colors.white),
        dialogTheme: DialogTheme(surfaceTintColor: Colors.white, backgroundColor: Colors.white,),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true
      ),
      home: HomeScreen(),
    );
  }
}