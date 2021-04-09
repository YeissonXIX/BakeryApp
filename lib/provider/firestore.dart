import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> anadirPasteles(String desc, String name, String price) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('pasteles');
    // Call the user's CollectionReference to add a new user
    return users
        .add({'descripcion': desc, 'nombre': name, 'precio': price})
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<void> obtenerPasteles() async {
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection('pasteles');
    QuerySnapshot querySnapshot = await _collectionRef.get();
    return querySnapshot.docs.map((doc) => doc.data()).toList();
  }
}
