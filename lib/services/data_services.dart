import 'package:cloud_firestore/cloud_firestore.dart';

class DataServices {
  final CollectionReference dataCollection = FirebaseFirestore.instance.collection('attendance');

  Future<QuerySnapshot> getData() {
    // utk dapet atau baca data dari database
    return dataCollection.get();
    //get = Read di CRUD
    // pengantar untuk get API dari luar
  }

  Future<void> deleteData(String docId) {
    return dataCollection.doc(docId).delete();
  }
}