
import 'dart:math';
import 'dart:ui';

import 'package:attendance_app/utils/google_ml_kit.dart';
import 'package:camera/camera.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

class FaceDetectorComponent {
  final FaceDetector faceDetector = GoogleMlKit.vision.faceDetector(FaceDetectorOptions(
    enableContours: true,
    enableClassification: true,
    enableTracking: true,
    enableLandmarks: true,
  ));

  Future<void> detectFaces(XFile image) async {
    final inputImage = InputImage.fromFilePath(image.path);
    final faces = await faceDetector.processImage(inputImage);

    for (Face face in faces) {
      //ngasih kotak di sekitar wajahnya
      final Rect boundingBox = face.boundingBox;
      // Rect biar ga bisa ditipu. jd dipastiin wajahnya itu 2d bukan 1d
      final double? verticalPosition = face.headEulerAngleY;
      // utk ngehandle posisi wajah secara vertikal.
      final double? horizontalPosition = face.headEulerAngleZ;
      // utk ngehandle posisi wajah secara horizontal.
      // knp ga pake X? karna bakalan rancu karna X itu bisa ke Y juga bisa ke Z. 
      
      // perkondisian apabila face landmark sudah aktif. ditandai dgn hidung mulut mata dan pipi, juga telinga.
      final FaceLandmark? leftEar = face.landmarks[FaceLandmarkType.leftEar];
      if (leftEar != null) {
        final Point<int> leftEarPosition = leftEar.position;
        // klo kupingnya kedeteksi, maka dia akan mereturn posisi kupingnya. klo ga, maka dia akan return null.
        print("Left Ear Position: $leftEarPosition");
}
        // perkondisian apabila wajahnya sudah terdeteksi. ditandai dgn bibir tersenyum
        if (face.smilingProbability != null) {
          final double? smileProbability = face.smilingProbability;
          print("Smile Probability: $smileProbability");
        }
      
      // perkondisian apabila tracking wajah sudah aktif
      if (face.trackingId != null) {
        final int? trackingId = face.trackingId;
        print("Tracking ID: $trackingId");
      }
    }
  }
}
